# `debug`

> This command is used in combination with php and will set variables:
> ```bash
> XDEBUG_CONFIG="remote_host=<<debug_host>>"
> PHP_IDE_CONFIG="serverName=<<debug_name>>"
> ```

### Usage

```bash
debug -h 127.0.0.1 # default is 0.0.0.0
 
debug -n my_host # default is localhost
 
debug -h 127.0.0.1 -n my_host
 
debug # the previous parameters or default ones will be persistent
```

> Is necessary only once to run it with parameters. Pass parameters only if you want to change them
