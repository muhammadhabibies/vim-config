" prerequisites install:
" 1. chocolatey untuk install vim
" 2. nodejs untuk npm i -g prettier untuk plugin prettier
" 3. vim-plug di powershell:
" iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |` ni $HOME/vimfiles/autoload/plug.vim -Force
" 4. :PlugInstall lalu tunggu installasi plugin, ketikan 'q' untuk quit
" setelah install ketikan ":so" atau ":so %" di vimrc untuk melihat langsung perubahan tanpa langsung quit, tapi kalau lagi buka file lain (ini ga bekerja gatau yang ini mah) ketikan :so ~/_vimrc aneh ga bekejra ini mah gatau tapi ya tinggal quit aja lalu masuk lagi aja sih, :PlugClean kalau mau mengomentari salah satu plugin sehingga nanti diihapus pluginnya dengan command ini, :PlugUpdate untuk mengupdate semua plugiin yang ada
" 5. di windows: vim ~/_vimrc (kalo operating system selain windows itu filenya namanya .vimrc ga pake underscore, underscore hanya untuk windows saja) dan masukkan ini (:set paste dulu agar tidak kena komentar semuanya pas ke paste):
"
" kalo di linux server install vim-plug copy 2 baris ini:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

" vim-plug - kalo mau nambah, tambahin, lalu :so % lalu :PlugInstall - :
call plug#begin()
  Plug 'preservim/nerdtree' " sidebar filetree
  Plug 'tpope/vim-commentary' " comment
  Plug 'rose-pine/vim' " theme rose pine
  Plug 'Yggdroot/indentline' " garis indentasi
  Plug 'jiangmiao/auto-pairs' " auto pairs
  Plug 'tpope/vim-fugitive' " fugitive git
  " Plug 'jbgutierrez/vim-better-comments' " ! test
  " Plug 'easymotion/vim-easymotion'
  Plug 'mbbill/undotree' " undotree

  Plug 'tpope/vim-surround' " mengganti surround
  " "test surround" => cs"' => 'test surround'
  " 'test surround' => cs'<q> => <q>test surround</q> 

  " fzf
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " the missing motion for vim, pakenya: s{2 karakter} untuk forward search dan S{2
  " karakter} untuk backward search, ; untuk next , untuk
  " back dan ctrl + O buat balik lagi cursor ke awal sebelum pencarian, dan
  " operator y, d, c itu bisa pake z atau Z, contoh: dz{char1}{char2} untuk
  " menghapus sampe exclusive yang dicari
  Plug 'justinmk/vim-sneak'

  " post install (yarn install | npm install) then load plugin only for editing supported files
  " Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
  Plug 'prettier/vim-prettier', { 'do': 'npm install' } "cara pakenya tinggal :Prettier
call plug#end()

" set leader key:
let mapleader = " "
let maplocalleader = " "

" fzf plugin:
" file search
nnoremap <leader>p :Files<CR>
" untuk Grep (Pencarian Teks dalam File), mencari teks dalam file menggunakan
" ripgrep (lebih cepat dari grep, pastikan sudah terinstal), ngelag, aku
" matiin, belum install ripgrep atau grep kayaknya jadi ngelag
" nnoremap <leader>g :Rg<CR>
" untuk Buffer List (Daftar Buffer Terbuka), beralih antar buffer yang terbuka
nnoremap <leader>b :Buffers<CR>
" history perintah di Vim
nnoremap <leader>h :History<CR>
" untuk Meningkatkan Kustomisasi (Misalnya GTags), jika menggunakan fzf#vim#
" fungsi bawaan, kamu bisa menambahkan sesuatu seperti ini:
" cari tags
nnoremap <leader>t :Tags<CR>        
" cari baris dalam file buffer terbuka
nnoremap <leader>l :Lines<CR>       
" cari marks
nnoremap <leader>m :Marks<CR>       

" undotree plugin:
nnoremap <leader>u :UndotreeToggle<CR>

" nerdtree plugin:
nnoremap <leader>pf :NERDTreeFocus<CR>
nnoremap <leader>pr :NERDTree<CR>
nnoremap <leader>pv :NERDTreeToggle<CR>
nnoremap <leader>pt :NERDTreeFind<CR>

" sneak plugin:
let g:sneak#label = 1 " for label-mode for a minimalist alternative to EasyMotion plugin
" matikan fitur otomatis Sneak yang bisa mengubah mapping default s dan S
nnoremap S cc
" gunakan Leader Key (\s) untuk Sneak maju
nmap <Leader>s <Plug>Sneak_s
nmap <Leader>S <Plug>Sneak_S
" gunakan Leader Key (\z) untuk Sneak mundur
nmap <Leader>z <Plug>Sneak_z
nmap <Leader>Z <Plug>Sneak_Z
" sneak has <Plug> mappings for f and t 1-character-sneak. These mappings do
" not invoke label-mode, even if you have it enabled:
map <Leader>f <Plug>Sneak_f
map <Leader>F <Plug>Sneak_F
map <Leader>t <Plug>Sneak_t
map <Leader>T <Plug>Sneak_T

" indentline plugin:
" let g:indentLine_faster = 1
" let g:indentLine_setConceal = 0
let g:indentLine_char_list = ['┆']
" vim
let g:indentLine_color_term = 239
" gvim
let g:indentLine_color_gui = '#333333'
" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

" rose-pine plugin:
set termguicolors
set background=dark
colorscheme rosepine_moon
" bg disini itu mengikuti terminal, kalau diganti black ya black, tapi kalau
" bg ini mengikuti terminal, tapi di autocmd harus black karena kalau bg
" jadinya mengikuti bg rose pine percuma
if has('gui_running') " supaya ga error di debian
  highlight Normal ctermbg=bg guibg=bg
  highlight NonText ctermbg=bg guibg=bg
  highlight LineNr ctermbg=bg guibg=bg
  highlight Folded ctermbg=bg guibg=bg
  highlight EndOfBuffer ctermbg=bg guibg=bg
endif
autocmd ColorScheme * highlight Normal ctermbg=black guibg=black
autocmd ColorScheme * highlight NonText ctermbg=black guibg=black
autocmd ColorScheme * highlight LineNr ctermbg=black guibg=black
autocmd ColorScheme * highlight Folded ctermbg=black guibg=black
autocmd ColorScheme * highlight EndOfBuffer ctermbg=black guibg=black
" disable italic:
autocmd ColorScheme * highlight Comment cterm=NONE gui=NONE
autocmd ColorScheme * highlight Italic cterm=NONE gui=NONE
autocmd ColorScheme * highlight Statement cterm=NONE gui=NONE

" prettier plugin:
" agar ketika di save, file yang support prettier akan format on save
" - BufWritePre ini adalah autocmd yang dijalankan sebelum menyimpan file
" - PrettierAsync ini adalah perintah untuk menjalankan Prettier secara asinkron
" sebelum file disimpan
" autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.html,*.css
" PrettierAsync <- ini kalo pake prettierasync ga jalan aneh njir
autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.html,*.css Prettier
" ------
" atur path prettier, jika ada terinstall secara local pake yang local
" version, kalau tidak ada pake yang prettier npm global
if filereadable('./node_modules/.bin/prettier')
    let g:prettier#config#prettier_cli_path = './node_modules/.bin/prettier'
else
    let g:prettier#config#prettier_cli_path = './AppData/Roaming/npm/prettier'
endif
" config:
let g:prettier#config#autoformat = 1  " aktifkan format on save
let g:prettier#config#tabWidth = 2  

" vim set:
set number relativenumber
set ruler " bar di bawah untuk current baris, column, persen file
set laststatus=2 " status bar
set wrap " automatically wrap text that extends beyond the screen length
set encoding=utf-8 " encoding
" indentation:
  set smartindent " mengaktifkan indentasi pintar untuk bahasa pemrograman tertentu, seperti C/C++, dimana indentasi tambahan akan diterapkan setelah {
  set autoindent " menyalakan indentasi otomatis berdasarkan baris sebelumnya
  set tabstop=2 " mengatur lebar tab menjadi <jumlah> spasi
  set shiftwidth=2 " mengatur lebar indentasi untuk perintah seperti >> (shift right) dan << (shift left)
  set expandtab " menggunakan spasi (bukan karakter tab) untuk indentasi
  set scrolloff=8 " scroll ctrl + e atau y cursor tidak ke ujung banget
syntax on " highlighting atau warna pada teks

" set compatibility to vim only (to ensure that we are setting the
" compatibility mode to vim only. Which means not vi. So we are going to
" specifically  limit this to vim only)
set nocompatible

" setup cursor
" 1. agar cursor tidak tipis ketika normal mode
" 2. agar jadinya memenuhi satu karakter ketika insert mode, bukan underscore
" set t_EI=[2\ q " aneh ini ketika aku restart laptop pake cmd dengan
" mengetikan shutdown -r -t 0, jadi ga jalan ini, dan yang bawah jadinya yang
" jalan
" set t_SI=[5\ q
" set t_SR=[4\ q
let &t_SI = "\e[5 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"

" vim mapping - nnoremap (di normal mode), vnoremap (di visual mode) - :
" nnoremap <leader>pv :Ex<CR> " remap :Ex[plore]

" memindahkan blok kode ke atas dan ke bawah
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" agar kursor tidak berpindah saat menggunakan 'J' untuk menggabungkan baris
nnoremap J mzJ`z

" kursor tengah layar saat scroll 1/2 halaman
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" kursor tengah layar saat next hasil pencarian
nnoremap n nzzzv
nnoremap N Nzzzv

