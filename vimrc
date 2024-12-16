syntax on
  set background=light
  filetype plugin indent on
  set nocompatible
  set hlsearch
  set autoread
  set expandtab
  set autoindent
  set number relativenumber
  set path+=**
  set ruler
  set wildmenu
  set noswapfile
  set showmatch
  set showcmd
  set splitright
  auto FileType yaml, nix, terraform setlocal ts=2 sts=2 sw=2 expandtab
  let mapleader=","
  set cursorline
  set scrolloff=5
  nmap <leader>w :wq<CR>
  nmap <leader>q :q!<CR>
  nmap <leader>bn :bn<CR>
  nnoremap <leader>f <c-w>f
  inoremap kj <esc>
  vnoremap kj <esc>
  nnoremap <space> :
  set list listchars+=eol:¬,trail:¶
  let &t_SI="\e[6 q"
  let &t_EI="\e[1 q"
  autocmd BufWritePre * %s/\s\+$//e
  let g:airline_powerline_forts = 1
  let g:airline_theme='dark'
  colorscheme dracula
  "remove hightlight from world on ENTER when searching
  nnoremap <silent><CR> :noh<CR>
  let g:LanguageClient_serverCommands = {
    \ 'nix': ['rnix-lsp']
\ }

