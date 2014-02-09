#
# Cookbook Name:: tf2
# Recipe:: default
#
# Copyright 2014, WTF Enterprises
#
# All rights reserved - Do Not Redistribute
#

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

# install packages from attributes, based on node platform
node['tf2-server']['packages']["#{node['platform_family']}"].each do |p|
  package p
end

# download steam_cmd from attribute value
remote_file "/home/#{node['tf2-server']['user']}/steamcmd_linux.tar.gz" do
  source node['tf2-server']['steam_cmd']['url']
  action :create_if_missing
end

template "/home/#{node['tf2-server']['user']}/update.sh" do
  source "update.sh.erb"
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
  variables({
    :install_dir => node['tf2-server']['steam']['install_dir']
    })
end

execute "set execute permissions on update script" do
  command "chmod +x update.sh"
  cwd     "/home/#{node['tf2-server']['user']}"
end

directory node['tf2-server']['steam']['install_dir'] do
  action :create
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
end

execute "untar steamcmd" do
  command "tar xzf steamcmd_linux.tar.gz -C #{node['tf2-server']['steam']['install_dir']} && touch .steamcmd_installed"
  cwd     "/home/#{node['tf2-server']['user']}"
  not_if  {File.exists?("/home/#{node['tf2-server']['user']}/.steamcmd_installed")}
end

template "#{node['tf2-server']['steam']['install_dir']}/tf2_ds.txt" do
  source "tf2_ds.txt.erb"
  user   node['tf2-server']['user']
  group  node['tf2-server']['group']
  variables({
    :install_dir => node['tf2-server']['tf2']['install_dir'],
    :enable_beta => node['tf2-server']['beta']['enable']
    })
end

execute "hacking ownership on tf2 install dir" do
  command "chown -R #{node['tf2-server']['user']}:#{node['tf2-server']['group']} #{node['tf2-server']['steam']['install_dir']}"
end

