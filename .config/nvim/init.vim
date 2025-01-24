" Load plugins
if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
        echo "Downloading junegunn/vim-plug to manage plugins..."
        silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
        silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
        autocmd VimEnter * PlugInstall
endif

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
        Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
        Plug 'preservim/nerdtree'
call plug#end()

" Basic setup and appearance
set title
set go=a
set nohlsearch
set clipboard+=unnamedplus
set noshowmode
set noruler
set laststatus=0
set noshowcmd
colorscheme catppuccin-mocha
highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none

" Other essentials
nnoremap c "_c
filetype plugin on
syntax on
set encoding=utf-8
set number relativenumber

" Enable autocompletion
set wildmode=longest,list,full

" Disables automatic commenting on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Perform dot commands over visual blocks
vnoremap . :normal .<CR>

" Spell-check set to <leader>o, 'o' for 'orthography'
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Splits open at the bottom and right
set splitbelow splitright

" Nerd Tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Replace ex mode with gq
map Q gq

" Check file in shellcheck
map <leader>s :!clear && shellcheck -x %<CR>

" Replace all is aliased to S
nnoremap S :%s//g<Left><Left>

" Save file as sudo on files that require root permission
cabbrev w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace and newlines at end of file on save and reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable
if &diff
        highlight! link DiffText MatchParen
endif

" Function for toggling the bottom statusbar
let s:hidden_all = 0
function! ToggleHiddenAll()
        if s:hidden_all  == 0
                let s:hidden_all = 1
                set noshowmode
                set noruler
                set laststatus=0
                set noshowcmd
        else
                let s:hidden_all = 0
                set showmode
                set ruler
                set laststatus=2
                set showcmd
        endif
endfunction
nnoremap <leader>h :call ToggleHiddenAll()<CR>

