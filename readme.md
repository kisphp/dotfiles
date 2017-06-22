# KISPHP Dotfiles

### Install

```
curl https://raw.githubusercontent.com/kisphp/dotfiles/master/install.sh | bash -
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
| makeup "my commit message" | run `git add .`, `git commit -m 'provided message'`, `git push` |


### Update

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
echo ". ~/.dotfiles/aliases.sh" >> ~/.bashrc

# reinitialize aliases
source ~/.bashrc
```

### If you have oh-my-zsh installed
```
# or if you have ohmyzsh installed
echo ". ~/.dotfiles/aliases.sh" >> ~/.zshrc

# reinitialize aliases
source ~/.zshrc
```
