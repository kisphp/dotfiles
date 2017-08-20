# KISPHP Dotfiles

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
| [Debug](docs/debug.md) | configure xdebug parameters for php scripts |
| [Makeup](docs/makeup.md) | faster commit and push to git repositorygst |
| pfix | run `php-cs-fixer fix v` command |
| codecept | run codeception suite |
| findbox | find virtual boxes in host machine |
| vagSrc | search for VM path |
| kvm | install kisphp virtual machine |
| vagon | run `vagrant up && vagrant ssh` |
| vagof | run `vagrant suspend` |
| vagoff | run `vagrant suspend && exit` |
| vagkill | run `vagrant destroy` |
| vagkil | alias to `vagkill` |
| apare | run `sudo /etc/init.d/apache2 restart` |
| ngre | run `sudo /etc/init.d/nginx restart` |
| myre | run `sudo /etc/init.d/mysql restart` |
| phpre | run `sudo /etc/init.d/php7-fpm restart` |
| [cln](docs/cln.md) | clone a repository from Github |

### Helpers

Git Config
 
`scripts/git-config.sh` setup git global configuration [git-config](scripts/git-config.sh)
 
Vim Config

`scripts/vim-config.sh` setup vim configurations for user [vim-config](scripts/vim-config.sh)
