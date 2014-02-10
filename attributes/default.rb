#============================#
# tf2-server Cookbook
#============================#

# default game server user and group
default['tf2-server']['user']  = 'tf2-server'
default['tf2-server']['group'] = 'tf2-server'

# array of public keys to install under game server user
default['tf2-server']['ssh']['public_keys'] = [
 ''
]

# array of packages to install on debian based platforms
default['tf2-server']['packages']['debian'] = ['lib32gcc1', 'ia32-libs']

# array of packages to install on rhel based platforms
default['tf2-server']['packages']['rhel']   = ['libgcc.i686', 'glibc.i686']

# toggle switch for beta, sets 'beta prerelease' in tf2_ds.txt
default['tf2-server']['beta']['enable'] = false

# installation directory for steam client
default['tf2-server']['steam']['install_dir'] = "/home/tf2-server/Steam"

# installation directory for tf2
default['tf2-server']['tf2']['install_dir'] = "/home/tf2-server/tf2"

# download link for steam_cmd
default['tf2-server']['steam_cmd']['url'] = "http://media.steampowered.com/client/steamcmd_linux.tar.gz"

##
# Crontab entry for updating TF2. Default is to run update 10pm every Monday.
# http://linux.die.net/man/5/crontab
##

default['tf2-server']['update']['enable']          = true
default['tf2-server']['update']['cron']['command'] = "/home/tf2-server/./update.sh"
default['tf2-server']['update']['cron']['minute']  = "0"
default['tf2-server']['update']['cron']['hour']    = "22"
default['tf2-server']['update']['cron']['day']     = "*"
default['tf2-server']['update']['cron']['month']   = "*"
default['tf2-server']['update']['cron']['weekday'] = "1"


