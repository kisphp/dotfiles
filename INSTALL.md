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