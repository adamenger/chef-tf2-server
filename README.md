tf2-server Cookbook
============
This cookbook will prep your server to be a Team Fortress 2 server.


Attributes
----------

#### tf2::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['tf2']['user']</tt></td>
    <td>String</td>
    <td>user</td>
    <td><tt>tf2</tt></td>
  </tr>
  <tr>
    <td><tt>['tf2']['user']</tt></td>
    <td>String</td>
    <td>user</td>
    <td><tt>tf2</tt></td>
  </tr>
</table>

Usage
-----

e.g.
Just include `tf2` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tf2]"
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
