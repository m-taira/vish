" カラースキーマ
colorscheme desert

" 行数を表示
set number

" vim-indent-guides

" タブのサイズを2にする
set tabstop=2 shiftwidth=2 expandtab

" vim開始時に有効にする
let g:indent_guides_enable_on_vim_startup = 1

" インデント表示を無効にする
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']

" 色
let g:indent_guides_auto_colors = 0
"autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=7
"autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=8

hi IndentGuidesOdd  guibg=red   ctermbg=235
hi IndentGuidesEven guibg=green ctermbg=237

" インデント表示のサイズ
let g:indent_guides_guide_size = 2
let g:indent_guides_start_level = 2

set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
" set shiftwidth=2 "自動インデントでずれる幅

" カッコを補完して改行
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>

" for vim-airline
" buffer をタブで表示
let g:airline#extensions#tabline#enabled = 1

" 表示したbufferに番号を追加
let g:airline#extensions#tabline#buffer_idx_mode = 1
