name             'tf2-server'
maintainer       'WTF Enterprises'
maintainer_email 'adamenger@gmail.com'
license          'All rights reserved'
description      'Installs/Configures tf2-server'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends "build-essential"
depends "apt", "= 2.3.6"
depends "yum", "= 2.4.4"
depends "runit", "= 1.5.8"
