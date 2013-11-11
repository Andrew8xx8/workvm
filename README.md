# workvm

## Usage

Simply include `recipe[workvm::default]`.

Define attributes

```ruby
 workvm: {
   user:      'vagrant',
   home:      '/home/vagrant',
   fullname:  'Andrew Kulakov',
   email:     'avk@8xx8.ru'
 }
```

## Attributes

<table>
  <tr>
    <th>Attribute</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>user</td>
    <td>The name of the user.</td>
  </tr>
  <tr>
    <td>home</td>
    <td>Home directory location.</td>
  </tr>
  <tr>
    <td>fullname</td>
    <td>User's fullname for git config.</td>
  </tr>
  <tr>
    <td>fullname</td>
    <td>User email for git config.</td>
  </tr>
  <tr>
    <td>ruby</td>
    <td>Ruby string for RVM (default 2.0.0)</td>
  </tr>
</table>
