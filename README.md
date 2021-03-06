# Dotfiles!

On new system clone repo, install [GNU Stow](https://www.gnu.org/software/stow/), navigate to dotfiles and eg `stow vim` to set up vim
dotfiles. (Or just `cp -r` to your home dir if you don't have Perl/CPAN/in a hurry/whatever.)

### Vim Instructions
Install the following plugins in `.vim/pack/` (not included in the repo because they're a bit bulky):
- [NERDTree](https://github.com/preservim/nerdtree)
- [Vim-airline](https://github.com/vim-airline/vim-airline)
- Tim Pope's [Vim-surround](https://github.com/tpope/vim-surround) + the associated [Vim-repeat](https://github.com/tpope/vim-repeat)
- Also tpope's [Vim-commentary](https://github.com/tpope/vim-commentary)

Install [Goyo](https://github.com/junegunn/goyo.vim/) and [Limelight](https://github.com/junegunn/limelight.vim) with `vim-plug` (into `~/.vim/plugged/`).

Heavy artillery:

- [ALE](https://github.com/dense-analysis/ale) 🍺 for linting
- [Coc](https://github.com/neoclide/coc.nvim) for completion
