#
# Cookbook Name:: tf2-server
# Recipe:: default
#
# Copyright 2014, WTF Enterprises
#
# All rights reserved - Do Not Redistribute
#

# based on which platform, run an update of the package manager
case node['platform_family']
  when "debian", "ubuntu"
    include_recipe "apt::default"
  when "redhat", "centos", "fedora"
    include_recipe "yum::default"
    include_recipe "yum::epel"
end

# install build essential tools now that repos are updated
include_recipe "build-essential"

# install runit for process management
include_recipe "runit"

package "gdb"
# create our user to run the game server
user node['tf2-server']['user'] do
  supports :manage_home => true
  action :create
  home "/home/#{node['tf2-server']['user']}"
  shell "/bin/bash"
end

# create group for user
group node['tf2-server']['group'] do
  action :create
end

# create .ssh directory so we can drop in our authorized keys
directory "/home/#{node['tf2-server']['user']}/.ssh" do
  action :create
  mode   "0700"
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
end

# drop in authorized keys from public_keys array, join them by newline
file "/home/#{node['tf2-server']['user']}/.ssh/authorized_keys" do
  content node['tf2-server']['ssh']['public_keys'].join("\n")
end

# create tf2 config directory so we can drop in our server.cfg
directory "#{node['tf2-server']['tf2']['install_dir']}/tf/cfg" do
  action :create
  mode   "0700"
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
  recursive true
end

template "#{node['tf2-server']['tf2']['install_dir']}/tf/cfg/server.cfg" do
  source "server.cfg.erb"
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
  variables ({
    # this is a deep hash
    :config => node['tf2-server']['server']['config']
    })
end

# drop in mapcycle, join them by newline
file "#{node['tf2-server']['tf2']['install_dir']}/tf/cfg/mapcycle.txt" do
  user    node['tf2-server']['user']
  group   node['tf2-server']['group']
  content node['tf2-server']['maps'].join("\n")
end

# drop in maplist, join them by newline
file "#{node['tf2-server']['tf2']['install_dir']}/tf/cfg/maplist.txt" do
  user    node['tf2-server']['user']
  group   node['tf2-server']['group']
  content node['tf2-server']['maps'].join("\n")
end

# drop in MOTD, join them by newline
template "#{node['tf2-server']['tf2']['install_dir']}/tf/cfg/motd.txt" do
  user    node['tf2-server']['user']
  group   node['tf2-server']['group']
  source  "motd.txt.erb"
  variables ({
    :server_name => node['tf2-server']['server']['config']['hostname'],
    :maps        => node['tf2-server']['maps'],
    })
end

# install packages from attributes, based on node platform
node['tf2-server']['packages']["#{node['platform_family']}"].each do |p|
  package p
end

# download steam_cmd from attribute value
remote_file "/home/#{node['tf2-server']['user']}/steamcmd_linux.tar.gz" do
  source node['tf2-server']['steam_cmd']['url']
  action :create_if_missing
end

# downloads the tf2 application initially and keeps it up to date.
# needs to be run after first succesful chef converge to install tf2
template "/home/#{node['tf2-server']['user']}/update.sh" do
  source "update.sh.erb"
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
  variables({
    :install_dir => node['tf2-server']['steam']['install_dir']
    })
end

# TODO: find a better way to do this? 
execute "set execute permissions on update script" do
  command "chmod +x update.sh"
  cwd     "/home/#{node['tf2-server']['user']}"
end

# directory which steam client is installed to
directory node['tf2-server']['steam']['install_dir'] do
  action :create
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
end

# TODO: is there a better way?
execute "untar steamcmd" do
  command "tar xzf steamcmd_linux.tar.gz -C #{node['tf2-server']['steam']['install_dir']} && touch .steamcmd_installed"
  cwd     "/home/#{node['tf2-server']['user']}"
  not_if  {File.exists?("/home/#{node['tf2-server']['user']}/.steamcmd_installed")}
end

# tells steam which app we want to download and if we want beta or not
template "#{node['tf2-server']['steam']['install_dir']}/tf2_ds.txt" do
  source "tf2_ds.txt.erb"
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
  variables({
    :install_dir => node['tf2-server']['tf2']['install_dir'],
    :enable_beta => node['tf2-server']['beta']['enable']
    })
end

# TODO: figure out why when i extract the steam_cmd tar why i can't override the default ubuntu owner
execute "hacking ownership on tf2 install dir" do
  command "chown -R #{node['tf2-server']['user']}:#{node['tf2-server']['group']} #{node['tf2-server']['steam']['install_dir']}"
end

runit_service "tf2-server"

# default is to update tf2 every monday night @ 10pm, runs as tf2 game server user
cron "update tf2" do
  command node['tf2-server']['update']['cron']['command']
  user    node['tf2-server']['user']
  minute  node['tf2-server']['update']['cron']['minute']
  hour    node['tf2-server']['update']['cron']['hour']
  minute  node['tf2-server']['update']['cron']['minute']
  day     node['tf2-server']['update']['cron']['day']
  month   node['tf2-server']['update']['cron']['month']
  weekday node['tf2-server']['update']['cron']['weekday']
  only_if { node['tf2-server']['update']['enable'] }
end
