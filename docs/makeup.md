#### `makeup`

Syntax:
```bash
makeup [-n] "commit message"
```

Usage:
```bash
makeup "my commit message"

# quotes are optional
makeup my commit message

# if you want to skip "git add ."
makeup -n my commit message
```

> You may run `makeup` function and pass parameters without quotes:
>
> ```bash
> makeup make more changes in branch
> ```
> the commit message will be: **make more changes in branch**
>

