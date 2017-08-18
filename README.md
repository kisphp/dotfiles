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

### If you have oh-my-zsh installed
```
# or if you have ohmyzsh installed
echo ". ~/.dotfiles/kisphp-dotfiles.sh" >> ~/.zshrc

# reinitialize aliases
source ~/.zshrc
```


### Aliases

| Command | Details |
| --- | --- |
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
| cln | clone a git repository `cln symfony/symfony_standard directory_name` (directory_name is optional) |

### Other aliases

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

