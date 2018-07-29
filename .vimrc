set nocompatible              " be iMproved, required
filetype off                  " required
let mapleader = " "
set hlsearch
set incsearch
set wildmenu
nnoremap <leader><space> :nohlsearch<CR>
nnoremap tt :tabnew<space>

" I haven't found how to hide this function (yet)
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction

" NB: this supports "rp that replaces the selection by the contents of @r
vnoremap <silent> <expr> p <sid>Repl()

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'easymotion/vim-easymotion'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

execute pathogen#infect()
set nu
set relativenumber
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
set mouse=a
set background=dark
set incsearch
set ignorecase
set smartcase
set title
syntax on
set smartindent
set autoindent
set tabstop=4
set shiftwidth=4
set expandtab
inoremap jk <Esc>
inoremap kj <Esc>
imap jj <Esc>
nnoremap ; :
filetype plugin indent on
set showbreak=↪
set autoread
au CursorHold * checktime
set background=dark
"colorscheme solarized
colorscheme molokai
let g:rehash256 = 1

"airline:
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_left_sep=''
let g:airline_right_sep=''


"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"to trick syntastic
au BufRead,BufNewFile *.sv set ft=verilog


let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
"nmap s <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

Plugin 'Yggdroot/indentLine'

" VIM autocommands for binary plist files
" Copyright (C) 2005 Moritz Heckscher
"
" Note: When a file changes externally and you answer no to vim's question if
" you want to write anyway, the autocommands (e.g. for BufWritePost) are still
" executed, it seems, which could have some unwanted side effects.
"
" This program is free software; you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation; either version 2 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
augroup plist
  " Delete existing commands (avoid problems if this file is sourced twice)
  autocmd!

  " Set binary mode (needs to be set _before_ reading binary files to avoid
  " breaking lines etc; since setting this for normal plist files doesn't
  " hurt and it's not yet known whether or not the file to be read is stored
  " in binary format, set the option in any case to be sure).
  " Do it before editing a file in a new buffer and before reading a file
  " into in an existing buffer (using ':read foo.plist').
  autocmd BufReadPre,FileReadPre *.plist set binary

  " Define a little function to convert binary files if necessary...
  fun MyBinaryPlistReadPost()
          " Check if the first line just read in indicates a binary plist
          if getline("'[") =~ "^bplist"
                  " Filter lines read into buffer (convert to XML with plutil)
                  '[,']!plutil -convert xml1 /dev/stdin -o /dev/stdout
                  " Many people seem to want to save files originally stored
                  " in binary format as such after editing, so memorize format.
                  let b:saveAsBinaryPlist = 1
          endif
          " Yeah, plain text (finally or all the way through, either way...)!
          set nobinary
          " Trigger file type detection to get syntax coloring etc. according
          " to file contents (alternative: 'setfiletype xml' to force xml).
          filetype detect
  endfun
  " ... and call it just after editing a file in a new buffer...
  autocmd BufReadPost *.plist call MyBinaryPlistReadPost()
  " ... or when reading a file into an existing buffer (in that case, don't
  " save as binary later on).
  autocmd FileReadPost *.plist call MyBinaryPlistReadPost() | let b:saveAsBinaryPlist = 0

  " Define and use functions for conversion back to binary format
  fun MyBinaryPlistWritePre()
          if exists("b:saveAsBinaryPlist") && b:saveAsBinaryPlist
                  " Must set binary mode before conversion (for EOL settings)
                  set binary
                  " Convert buffer lines to be written to binary
                  silent '[,']!plutil -convert binary1 /dev/stdin -o /dev/stdout
                  " If there was a problem, e.g. when the file contains syntax
                  " errors, undo the conversion and go back to nobinary so the
                  " file will be saved in text format.
                  if v:shell_error | undo | set nobinary | endif
          endif
  endfun
  autocmd BufWritePre,FileWritePre *.plist call MyBinaryPlistWritePre()
  fun MyBinaryPlistWritePost()
          " If file was to be written in binary format and there was no error
          " doing the conversion, ...
          if exists("b:saveAsBinaryPlist") && b:saveAsBinaryPlist && !v:shell_error
                  " ... undo the conversion and go back to nobinary so the
                  " lines are shown as text again in vim.
                  undo
                  set nobinary
          endif
  endfun
  autocmd BufWritePost,FileWritePost *.plist call MyBinaryPlistWritePost()
augroup END
