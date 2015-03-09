# Foxtail Cookbook
### Todos:
#### Front-end application TODOs
- [x] Install NodeJS

#### CMS Todos
- [ ] Install Apache
- [ ] Configure Apache Virtualhost on port 8080
- [ ] Install MySQL
- [ ] Install PHP-FPM
- [ ] Install Drupal from Drush Makefile
- [ ] Setup common `settings.php` with environment overrides



## Supported Platforms

TODO: List your supported platforms.

## Attributes

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['foxtail-cookbook']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

## Usage

### foxtail-cookbook::default

Include `foxtail-cookbook` in your node's `run_list`:

```json
{
  "run_list": [
    "recipe[foxtail-cookbook::default]"
  ]
}
```

## License and Authors

Author:: YOUR_NAME (<YOUR_EMAIL>)
