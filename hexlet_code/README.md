[![linter & tests](https://github.com/asagafonov/rails-project-63/actions/workflows/hexlet-code.yml/badge.svg)](https://github.com/asagafonov/rails-project-63/actions/workflows/hexlet-code.yml)

# How to use

### Your code
```
HexletCode.form_for(@user2, url: "/users") do |f|
    f.input(:name, class: "user-input")
    f.input(:profession, as: "text", rows: 50, cols: 50)
end
```

### Output

```
<form action="/users" method="post">
    <input name="name" type="text" value="Bobby" class="user-input" />
    <textarea name="profession" cols="50" rows="50">Software engineer</textarea>
</form>
```