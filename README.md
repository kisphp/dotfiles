# KISPHP Dotfiles

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/0c226a27d3a441f8a138d42aacd882ea)](https://www.codacy.com/app/mariusbogdan83/dotfiles?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=kisphp/dotfiles&amp;utm_campaign=Badge_Grade)

### Install

```
curl https://raw.githubusercontent.com/kisphp/dotfiles/master/install.sh | bash -
```

### Update

> The tool will auto update by itself

```
cd ~/.dotfiles
git pull

# reinitialize aliases
source ~/.bashrc
# or
source ~/.zshrc # if you use zsh
```

### Manual Install

```
# go to home directory
cd ~ 

# clone repository
git clone https://github.com/kisphp/dotfiles.git .dotfiles

# include dotfiles script in bash file
echo ". ~/.dotfiles/kisphp-dotfiles.sh" >> ~/.bashrc

# reinitialize aliases
source ~/.bashrc
```

### If you have oh-my-zsh installed or use zsh as default shell
```
# or if you have ohmyzsh installed
echo ". ~/.dotfiles/kisphp-dotfiles.sh" >> ~/.zshrc

# reinitialize aliases
source ~/.zshrc
```

### Aliases

| Command | Details |
| --- | --- |
| apare | run `sudo /etc/init.d/apache2 restart` |
| [cln](docs/cln.md) | clone a repository from Github |
| codecept | run codeception suite |
| [Debug](docs/debug.md) | configure xdebug parameters for php scripts |
| findbox | find virtual boxes in host machine |
| gign | add file or directory to gitignore |
| kvm | install kisphp virtual machine |
| [Makeup](docs/makeup.md) | faster commit and push to git repositorygst |
| myre | run `sudo /etc/init.d/mysql restart` |
| ngre | run `sudo /etc/init.d/nginx restart` |
| pfix | run `php-cs-fixer fix v` command |
| phpre | run `sudo /etc/init.d/php7-fpm restart` |
| vagon | run `vagrant up && vagrant ssh` |
| vagof | run `vagrant suspend` |
| vagoff | run `vagrant suspend && exit` |
| vagkill | run `vagrant destroy` |
| vagkil | alias to `vagkill` |
| vagSrc | search for VM path |

### Helpers

Git Config
 
`scripts/git-config.sh` setup git global configuration [git-config](scripts/git-config.sh)
 
Vim Config

`scripts/vim-config.sh` setup vim configurations for user [vim-config](scripts/vim-config.sh)
