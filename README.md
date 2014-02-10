tf2-server-server Cookbook
============
This cookbook will prep your server to be a Team Fortress 2 server.

**Note**: The default recipe will only **prep** your server to host tf2. You will still need to login and perform ./update.sh from the home directory to actually perform the initial TF2 installation.

Recipes
-------

#### default.rb
Creates user and group on the target system and downloads steam client under users home directory. Installs prerequisite packages and adds in any specified public keys to authorized_keys. After this we download and extract the steam client into the users home directory. Additionally, we enable a crontab entry for updating the tf2 installation every Monday at 10pm.

Attributes
----------

#### tf2-server::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['user']</tt></td>
    <td>String</td>
    <td>user</td>
    <td><tt>tf2-server</tt></td>
  </tr>
  <tr>
    <td><tt>['group']</tt></td>
    <td>String</td>
    <td>group</td>
    <td><tt>tf2-server</tt></td>
  </tr>
  <tr>
    <td><tt>['ssh']['public_keys']</tt></td>
    <td>Array</td>
    <td>array for ssh public keys for game server user</td>
    <td><tt>empty</tt></td>
  </tr>
  <tr>
    <td><tt>['packages']['debian']</tt></td>
    <td>Array</td>
    <td>array of prequisite packages to install for steam on debian platforms</td>
    <td><tt>'lib32gcc1', 'ia32-libs'</tt></td>
  </tr>
  <tr>
    <td><tt>['packages']['rhel']</tt></td>
    <td>Array</td>
    <td>array of prequisite packages to install for steam on rhel platforms</td>
    <td><tt>'libgcc.i686', 'glibc.i686'</tt></td>
  </tr>
  <tr>
    <td><tt>['beta']['enable']</tt></td>
    <td>Boolean</td>
    <td>toggle switch for enabling beta server</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['steam']['install_dir']</tt></td>
    <td>String</td>
    <td>installation directory for steam</td>
    <td><tt>/home/tf2-server/Steam</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2']['install_dir']</tt></td>
    <td>String</td>
    <td>installation directory for tf2</td>
    <td><tt>/home/tf2-server/tf2</tt></td>
  </tr>
  <tr>
    <td><tt>['steam_cmd']['url']</tt></td>
    <td>String</td>
    <td>url to download steam_cmd from</td>
    <td><tt>http://media.steampowered.com/client/steamcmd_linux.tar.gz</tt></td>
  </tr>
  <tr>
    <td><tt>['update']['enable']</tt></td>
    <td>Boolean</td>
    <td>toggle switch for auto-update via cron</td>
    <td><tt>true</tt></td>
  </tr>
</table>

#### update attributes
Default is enabled and set to run every Monday at 10pm.
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['enable']</tt></td>
    <td>Boolean</td>
    <td>toggle auto-update via cron</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['cron']['command']</tt></td>
    <td>String</td>
    <td>command to run in crontab</td>
    <td><tt>/home/tf2-server/./update.sh</tt></td>
  </tr>
  <tr>
    <td><tt>['cron']['minute']</tt></td>
    <td>Integer</td>
    <td>0-59</td>
    <td><tt>0</tt></td>
  </tr>
  <tr>
    <td><tt>['cron']['hour']</tt></td>
    <td>Integer</td>
    <td>0-23</td>
    <td><tt>22</tt></td>
  </tr>
  <tr>
    <td><tt>['cron']['day']</tt></td>
    <td>Integer</td>
    <td>1-31</td>
    <td><tt>*</tt></td>
  </tr>
  <tr>
    <td><tt>['cron']['month']</tt></td>
    <td>Integer or String</td>
    <td>1-12 or Jan-Dec</td>
    <td><tt>*</tt></td>
  </tr>
  <tr>
    <td><tt>['cron']['weekday']</tt></td>
    <td>0-6 or Sat-Sun</td>
    <td>Day of Week</td>
    <td><tt>1</tt></td>
  </tr>
</table>


Usage
-----

e.g.
Just include `tf2-server` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tf2-server]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Authors: adamenger@gmail.com
