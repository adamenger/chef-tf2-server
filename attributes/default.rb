#============================#
# tf2-server Cookbook
#============================#

default['tf2-server']['user']  = 'tf2-server'
default['tf2-server']['group'] = 'tf2-server'

default['tf2-server']['ssh']['public_keys'] = [
 ''
]

default['tf2-server']['packages']['debian'] = ['lib32gcc1', 'ia32-libs']
default['tf2-server']['packages']['rhel']   = ['libgcc.i686', 'glibc.i686']

#will enable beta in tf2_ds.txt
default['tf2-server']['beta']['enable'] = false

default['tf2-server']['steam']['install_dir'] = "/home/tf2-server/Steam"
default['tf2-server']['tf2']['install_dir'] = "/home/tf2-server/tf2"
default['tf2-server']['steam_cmd']['url'] = "http://media.steampowered.com/client/steamcmd_linux.tar.gz"


