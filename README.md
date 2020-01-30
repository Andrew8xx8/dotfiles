# ~8xx8 dotfiles

My dotfiles.

## Install

Run this:

```sh
git clone https://github.com/Andrew8xx8/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

If you have docker && docker compose run after:

```sh
docker-compose run --rm dotfiles bash
cd /dotfiles/.dotfiles
PWD=/dotfiles/.dotfiles rake install[YOUR_GIT_EMAIL,YOUR_GIT_NAME]
```

If you do not:

```sh
docker-compose run --rm dotfiles bash
cd ~/.dotfiles
PWD=~/.dotfiles rake install[YOUR_GIT_EMAIL,YOUR_GIT_NAME]
```

This will symlink the appropriate files in `.dotfiles` to your home
directory. Everything is configured and tweaked within `~/.dotfiles`.

## Thanks

These dotfiles forked from [akalyaev dotfiles](https://github.com/akalyaev/dotfiles) that heavily inspired by [holman does
dotfiles](https://github.com/holman/dotfiles).
