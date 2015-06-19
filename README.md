tingyun Cookbook
================
Install [聽雲](http://www.tingyun.com/) agent

Attributes
----------

e.g.
#### tingyun::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['tingyun']['source']</tt></td>
    <td>String</td>
    <td>Agent Source</td>
    <td><tt>http://download.networkbench.com/agent/system/</tt></td>
  </tr>
  <tr>
    <td><tt>['tingyun']['version']</tt></td>
    <td>String</td>
    <td>Tingyu Agent Source</td>
    <td><tt>latest</tt></td>
  </tr>
  <tr>
    <td><tt>['tingyun']['license_key']</tt></td>
    <td>String</td>
    <td>Tingyu Agent license_key</td>
    <td><tt>xxxxxxxx</tt></td>
  </tr>
</table>

Usage
-----
#### tingyun::default

e.g.
Just include `tingyun` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tingyun]"
  ]
}
```

Contributing
------------

e.g.
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
MIT
