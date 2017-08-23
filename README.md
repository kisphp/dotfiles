# KISPHP Dotfiles

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/0c226a27d3a441f8a138d42aacd882ea)](https://www.codacy.com/app/mariusbogdan83/dotfiles?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=kisphp/dotfiles&amp;utm_campaign=Badge_Grade)

### Install

To install this tool just execute this line on your terminal. Installation directory will be `~/.dotfiles`
```
curl https://raw.githubusercontent.com/kisphp/dotfiles/master/install.sh | bash -
```

> [For manual installation click here](INSTALL.md)


## Available Aliases

| Command | Details |
| --- | --- |
| allow_ssh_auth | `allow_ssh_auth user@server.domain` will allow you to connect via SSH without password |
| apare | run `sudo /etc/init.d/apache2 restart` |
| [cln](docs/cln.md) | clone a repository from Github |
| codecept | run codeception suite |
| [debug](docs/debug.md) | configure xdebug parameters for php scripts |
| findbox | find virtual boxes in host machine |
| gign | add file or directory to gitignore |
| git_clean_repo | remove merged branched from local and remote |
| kvm | install kisphp virtual machine |
| [Makeup](docs/makeup.md) | faster commit and push to git repositorygst |
| mcd | create directory and get inside it |
| myre | run `sudo /etc/init.d/mysql restart` |
| ngre | run `sudo /etc/init.d/nginx restart` |
| o | Open file in default app, open url in browser from terminal |
| p2 | run python 2 |
| p3 | run python 3 |
| pfix | run `php-cs-fixer fix v` command |
| phpre | run `sudo /etc/init.d/php7-fpm restart` |
| vagon | run `vagrant up && vagrant ssh` |
| vagof | run `vagrant suspend` |
| vagoff | run `vagrant suspend && exit` |
| vagkill | run `vagrant destroy` |
| vagkil | alias to `vagkill` |
| vagSrc | search for VM path |

## Configuration scripts

Git Config (will require user interaction for name and email)
 
`scripts/git-config.sh` setup git global configuration [git-config](scripts/git-config.sh)
 
Vim Config

`scripts/vim-config.sh` setup vim configurations for user [vim-config](scripts/vim-config.sh)
