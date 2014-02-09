#============================#
# tf2-server Cookbook
#============================#

default['tf2-server']['user']  = 'tf2-server'
default['tf2-server']['group'] = 'tf2-server'

default['tf2-server']['ssh']['public_keys'] = [
  'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5QTlAwK96FpjIV239i79xXxHv1sEYUVogFKwEjQmA6yYFNwz39/yviz053LbpJ8KaQPNCwzjBH9Luie8K6xDD7bH18Kh8HxPIUhQl8eFuPqw1dOh2hpSZMH1Qwp8P9MavD8yKpTeP9lekJVf40eC1XQM59K4EEaiVcSxyiUnk0m94SjjAyRJpx9/AYKVKLAoSVt7QGFPCD0w/D0ZGmvI6M5tKdM0XD9hrzBcw+h8cUY9dB4tvHoPa7wSC/WQLtMdxKFU7H5WJlgKtj6QddtmEhZw+d7z54IUDR+PGBrmggFYBZdHWVLhWyXaUN1WrIpvaOOY4PPSe/wnZrhiTPJwl adam@adam-enger',
]

default['tf2-server']['packages']['debian'] = ['lib32gcc1', 'ia32-libs']
default['tf2-server']['packages']['rhel']   = ['libgcc.i686', 'glibc.i686']

#will enable beta in tf2_ds.txt
default['tf2-server']['beta']['enable'] = false

default['tf2-server']['steam']['install_dir'] = "/home/tf2-server/Steam"
default['tf2-server']['tf2']['install_dir'] = "/home/tf2-server/tf2"
default['tf2-server']['steam_cmd']['url'] = "http://media.steampowered.com/client/steamcmd_linux.tar.gz"


