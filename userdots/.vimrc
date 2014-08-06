call pathogen#infect()
filetype plugin indent on
set number

" General options
set mousemodel=popup                                        " right-click pops up conext menu
set encoding=utf-8 fileencoding=utf-8 termencoding=utf-8    " encoding
set showmatch                                               " show matching parenthesis/brackets/braces
set backspace=indent,eol,start                              " sane backspace

" Configure Indentation
set tabstop=4 shiftwidth=4 expandtab                        " prefer 4-space tabs
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType jade setlocal shiftwidth=2 tabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType coffee setlocal shiftwidth=2 tabstop=2
set smartindent
set expandtab
syntax on

" Handle column overflow
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%>80v.\+/

" Status bar
set noruler
set laststatus=2
set statusline=%t                                           "tail of the filename
set statusline+=\ [%{strlen(&fenc)?&fenc:'none'},           "file encoding
set statusline+=%{&ff}]\                                    "file format
set statusline+=%h                                          "help file flag
set statusline+=%m                                          "modified flag
set statusline+=%r                                          "read only flag
set statusline+=%y                                          "filetype
set statusline+=%=                                          "left/right separator
set statusline+=%cC,                                        "cursor column
set statusline+=%l/%LL                                      "cursor line/total lines
set statusline+=\ %P                                        "percent through file

" Theme and color options
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="low"

hi LineNr ctermbg=none ctermfg=darkgreen
hi Identifier ctermfg=yellow
hi Normal ctermfg=gray
hi Visual cterm=reverse ctermfg=none ctermbg=none
hi Operator ctermfg=green
hi CursorLineNr ctermfg=darkyellow
hi CursorLine cterm=bold ctermfg=none ctermbg=none
hi CursorColumn cterm=bold ctermfg=none ctermbg=none
hi OverLength ctermbg=none ctermfg=darkred cterm=underline
hi colorcolumn ctermbg=none ctermfg=darkred cterm=underline

" Theme
set background=dark
colorscheme solarized

" Clear search highlighting
nnoremap <CR> :noh<CR><CR>

" Navigate splits with Tab.
nnoremap <Tab> <C-W>w
nnoremap <S-Tab> <C-W>W

:nmap <Space> i_<Esc>r
:set nowrap

:nmap j gj
:nmap k gk
:nmap <C-e> :e#<CR>

" Fuzzy search
:nmap ; :CtrlPMixed<CR>
:let g:ctrlp_map = '<Leader>t'
:let g:ctrlp_match_window_bottom = 0
:let g:ctrlp_match_window_reversed = 0
:let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
:let g:ctrlp_working_path_mode = 0
:let g:ctrlp_dotfiles = 0
:let g:ctrlp_switch_buffer = 0

if $TERM == "xterm-256color" || $TERM == "screen-256color" || $COLORTERM == "gnome-terminal"
    set t_Co=256
endif

" General custom key bindings
:let mapleader = ","

" Tip #750: http://vim.wikia.com/wiki/VimTip750
" Underline the current line.
nnoremap <F9> yyp<c-v>$r-
inoremap <F9> <esc>yyp<c-v>$r-A

" Tagbar
nnoremap <F8> :TagbarToggle<CR>

" Auto-reload vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

set list listchars=tab:»\ ,trail:·,precedes:<,extends:> " 

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()
