[![Actions Status](https://github.com/asagafonov/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/asagafonov/rails-project-63/actions)

[![linter & tests](https://github.com/asagafonov/rails-project-63/actions/workflows/hexlet-code.yml/badge.svg)](https://github.com/asagafonov/rails-project-63/actions/workflows/hexlet-code.yml)

# How to use

### Your code
```
user = Struct::User.new(name: 'Bobby', profession: 'Software engineer')

HexletCode.form_for(user, url: "/users") do |f|
    f.input :name, class: "user-input"
    f.input :profession, as: "text", rows: 50, cols: 50
    f.submit 'Confirm'
end
```

### Output

```
<form action="/users" method="post">
    <input name="name" type="text" value="Bobby" class="user-input">
    <textarea name="profession" cols="50" rows="50">Software engineer</textarea>
    <input type="submit" value="Confirm">
</form>
```