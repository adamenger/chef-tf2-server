tf2-server-server Cookbook
============
This cookbook will prep your server to be a Team Fortress 2 server.


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
    <td><tt>['tf2-server']['user']</tt></td>
    <td>String</td>
    <td>user</td>
    <td><tt>tf2-server-server</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2-server-']['group']</tt></td>
    <td>String</td>
    <td>group</td>
    <td><tt>tf2-server-server</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2-server']['ssh']['public_keys']</tt></td>
    <td>Array</td>
    <td>array for ssh public keys for tf2-server user</td>
    <td><tt>empty</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2-server']['packages']['debian']</tt></td>
    <td>Array</td>
    <td>array of prequisite packages to install for steam on debian platforms</td>
    <td><tt>'lib32gcc1', 'ia32-libs'</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2-server']['packages']['rhel']</tt></td>
    <td>Array</td>
    <td>array of prequisite packages to install for steam on rhel platforms</td>
    <td><tt>'libgcc.i686', 'glibc.i686'</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2-server']['beta']['enable']</tt></td>
    <td>Boolean</td>
    <td>toggle switch for enabling beta server</td>
    <td><tt>false</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2-server']['steam']['install_dir']</tt></td>
    <td>String</td>
    <td>installation directory for steam</td>
    <td><tt>/home/tf2-server/Steam</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2-server']['tf2']['install_dir']</tt></td>
    <td>String</td>
    <td>installation directory for tf2</td>
    <td><tt>/home/tf2-server/tf2</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2-server']['steam_cmd']['url']</tt></td>
    <td>String</td>
    <td>url to download steamcmd from</td>
    <td><tt>http://media.steampowered.com/client/steamcmd_linux.tar.gz</tt></td>
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
