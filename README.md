# KISPHP Dotfiles

[![Codacy Badge](https://api.codacy.com/project/badge/Grade/0c226a27d3a441f8a138d42aacd882ea)](https://www.codacy.com/app/mariusbogdan83/dotfiles?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=kisphp/dotfiles&amp;utm_campaign=Badge_Grade)

### Install

To install this tool just execute this line on your terminal. Installation directory will be `~/.dotfiles`
```
curl https://raw.githubusercontent.com/kisphp/dotfiles/master/install.sh | bash -
```

> [For manual installation click here](INSTALL.md)


## Configuration `~/.dotfiles.cfg`

| Parameter | Default Value | Info |
| --- | --- | --- |
| KP_DEBUG | 0 | enable debug messages |
| KP_LOGS | 0 | keep a log with all commands executed by the tool |
| KP_COLORS | 1 | enable colored text |
| KP_UPGRADE_DAYS | 432000 | check for upgrade at each 5 days |

## Available Aliases

| Command | Details |
| --- | --- |
| _upgrade_dotfiles | force update of the tool |
| _upgrade_dotfiles_timestamp | update last check lock file |
| _should_upgrade | check for new upgrades |
| allow_ssh_auth | `allow_ssh_auth user@server.domain` will allow you to connect via SSH without password. For a different port to ssh, just append `-p <port_number>` at the end |
| apare | run `sudo /etc/init.d/apache2 restart` |
| banip | ban ip address |
| clean_repo | alias to `git_clean_repo` |
| [cln](docs/cln.md) | clone a repository from Github |
| codecept | run codeception suite |
| [debug](docs/debug.md) | configure xdebug parameters for php scripts |
| edited | display edited files in repository |
| ged | alias to `edited` |
| gign | add file or directory to gitignore |
| git_config | Run git configuration script |
| git_clean_repo | remove merged branched from local and remote |
| kvm | install kisphp virtual machine |
| labelText | Text on blue background |
| listbox | List vagrant boxes location |
| edit | Open PHPStorm in specified directory. If no directory is given, then it will open in current directory |
| elre | Restart Elasticsearch |
| eltest | Check elasticsearch response with curl. Usage `eltest` or specify the port: `eltest 10009` |
| errorText | Text on red background |
| infoText | Text on yello background |
| successText | Text on green background |
| [makeup](docs/makeup.md) | faster commit and push to git repositorygst |
| mcd | create directory and get inside it |
| mergefile | `mergefile original_file file_to_merge_in_original` get content from second file and merge it with first file |
| myre | run `sudo /etc/init.d/mysql restart` |
| ngre | run `sudo /etc/init.d/nginx restart` |
| o | Open file in default app, open url in browser from terminal |
| p2 | run python 2 |
| p3 | run python 3 |
| php_project | create a php project in current directory |
| pfix | run `php-cs-fixer fix v` command |
| pipup | upgrade pip packages |
| pip3up | upgrade pip3 packages |
| phpre | run `sudo /etc/init.d/php7-fpm restart` |
| sf | shortcut to `app/console` or `bin/console` or `vendor/bin/console` |
| showlogs | show continuous updates in system log files from /var/logs. It can receive a path as firts parameter `showlogs /path/` |
| uncommit | Cancel last commit (if it was not pushed) |
| vim_config | Run VIM configuration script |
| vagon | run `vagrant up $@ && vagrant ssh` |
| vagof | run `vagrant suspend` |
| vagoff | run `vagrant suspend && exit` |
| vagkill | run `vagrant destroy && exit`  |
| vagkil | run `vagrant destroy` |
| vagSrc | search for VM path |
| vstopr | stop all vagrant running machines |
| vsh | run `vagrant ssh` |
| vst | run `vagrant status` |
| vup | run `vagrant up` |
| von | run `vaon` function |
| writeErrorMessage | called in some commands when they fail to display the errorText |

## Configuration scripts

Git Config (will require user interaction for name and email)

`scripts/git-config.sh` setup git global configuration [git-config](scripts/git-config.sh)

Vim Config

`scripts/vim-config.sh` setup vim configurations for user [vim-config](scripts/vim-config.sh)


# Make ISO images on Linux

```bash
sudo dd if=/dev/cdrom of=/path/to/cd.iso
# or
sudo dd if=/dev/dvd of=/path/to/dvd.iso
```

> ### Explanation
> `sudo` only if the user doesn't have enough permissions
> `dd` stands for Disk Dump
> `if` stands for Input File
> `of` stands for Output File

# Mounting an image

```bash
mkdir -p /mnt/isoimage
mount -o loop -t iso9660 cd.iso /mnt/isoimage
```

# Unmounting

```bash
umount -lf /mnt/isoimage
```
