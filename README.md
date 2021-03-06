# sixpack_ab-cookbook

Chef cookbook for Sixpack AB testing application. 

https://github.com/seatgeek/sixpack

## Supported Platforms

CentOS 6.5

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['sixpack_ab']['sixpack']['repo']</tt></td>
    <td>string</td>
    <td>github repo</td>
    <td><tt>https://github.com/seatgeek/sixpack</tt></td>
  </tr>
  <tr>
    <td><tt>['sixpack_ab']['sixpack]['branch']</tt></td>
    <td>string</td>
    <td>github branch</td>
    <td><tt>master</tt></td>
  </tr>
</table>

## Usage

### sixpack_ab::default OR sixpack::sixpack_packaged

Include `sixpack_ab` in your node's `run_list`, default installs from source, sixpack_packaged installs via pip:

```json

{
  "run_list": [
    "recipe[sixpack_ab::default]"
  ]
}
```

### if using the included Vagrant file remove or change the repo or branch

```
chef.json = {
  sixpack_ab: {
    sixpack: {
      repo: 'git://github.com/ricksaenz/sixpack.git',
      branch: 'rs_environment'
    }
  }
}
```

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: Rick Saenz (<wreeky@gmail.com>)
