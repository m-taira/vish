" gitgutter(変更箇所が左側似記号で気表示される)で常に表示
set signcolumn=yes

" 保存せずにバッファを切り替える
set hidden

" syntax highlight
syntax on

" 外部でファイルが更新された場合、自動的に再読み込み
set autoread

" カラースキーマ
colorscheme molokai
hi Comment ctermfg=102
hi Visual  ctermbg=249

" 行数を表示
set number

" vim-indent-guides

" タブのサイズを2にする
set tabstop=2 shiftwidth=2 expandtab

" 不可視文字を可視化(タブが「▸-」と表示される)
set list listchars=tab:\▸\-

" vim開始時に有効にする
let g:indent_guides_enable_on_vim_startup = 1

" インデント表示を無効にする
" let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" 色
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=7
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

hi IndentGuidesOdd  guibg=red   ctermbg=235
hi IndentGuidesEven guibg=green ctermbg=237

" インデント表示のサイズ
let g:indent_guides_guide_size = 2

" インデントに色付けを開始する階層
let g:indent_guides_start_level = 1

set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set shiftwidth=2 "自動インデントでずれる幅

" カッコを補完して改行
" inoremap {<Enter> {}<Left><CR><ESC><S-o>
" inoremap [<Enter> []<Left><CR><ESC><S-o>
" inoremap (<Enter> ()<Left><CR><ESC><S-o>

" for vim-airline
" buffer をタブで表示
" let g:airline#extensions#tabline#enabled = 1

" 表示したbufferに番号を追加
" let g:airline#extensions#tabline#buffer_idx_mode = 1

" NERDTree で ^G と表示される件の対応
let g:NERDTreeNodeDelimiter = "\u00a0"

" gitgutter
set updatetime=250
highlight GitGutterAdd ctermbg=193 ctermfg=2
highlight GitGutterChange ctermbg=193 ctermfg=2
highlight GitGutterDelete ctermbg=231 ctermfg=1

" jjでINSERTモードを抜ける
inoremap <silent> jj <ESC>


" setting
"文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd


" 現在の行を強調表示
set cursorline
" 現在の行を強調表示（縦）
"set cursorcolumn
" 行末の1文字先までカーソルを移動できるように
" set virtualedit=onemore
