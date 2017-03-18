" ========================================================
" *-------- 全体設定 --------*
" ========================================================
set nocompatible  "vi互換機能オフ
let mapleader = "\<Space>"  "leaderキー変更


" ========================================================
" *-------- NeoBundle --------*
" ========================================================
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
 set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'mattn/emmet-vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-endwise'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ========================================================
" *---- 各プラグイン設定 ----*
" ========================================================
" ========================================
" *-- mattn/emmet-vim --*
" ========================================
let g:user_emmet_leader_key='<C-E>'  "html:5 => Ctrl => e => ,

" ========================================
" *-- nathanaelkane/vim-indent-guides --*
" ========================================
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_auto_colors=0
" http://h2plus.biz/hiromitsu/wp-content/uploads/2012/07/termcolor.jpg
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=127
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=167
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" ========================================
" *-- scrooloose/nerdtree --*
" ========================================
let NERDTreeShowHidden = 1  "隠しファイル表示
nnoremap <silent><C-n> :NERDTreeToggle<CR>
"水平分割で開く: i  #gi(移動なし)
"垂直分割で開く: s  #gs(移動なし)

" ========================================
" *-- scrooloose/syntastic --*
" ========================================
" 対応言語: https://github.com/scrooloose/syntastic#1-introduction
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" ========================================
" *-- thinca/vim-quickrun --*
" ========================================
" https://github.com/thinca/vim-quickrun/blob/master/doc/quickrun.jax
nnoremap <Leader>r :QuickRun<CR>
"let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config = {
  \ '_': {
  \   'outputter/buffer/split'  : ':rightbelow 8sp',
  \   'outputter/buffer/close_on_empty' : 1,
  \   'hook/time/enable' : 1
  \   }
  \}

"アクティブなウィンドウ以外閉じる(vimの機能)
nnoremap <Leader>o :only<CR>

" ========================================
" *-- tomtom/tcomment_vim --*
" ========================================
" 範囲選択 => gcでコメントイン・アウト切り替え

" ========================================
" *-- tpope/vim-endwise --*
" ========================================
" nothing


" ========================================================
" *-------- 色 --------*
"   現在の設定状況は、:highlightで確認可能。
" ========================================================
colorscheme molokai  "カラースキーマ
syntax on  "シンタックスカラーリングを設定する
set t_Co=256  "256色使用する

"コマンドラインの背景色をvimの背景色に引き継ぐ
autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none

"コマンドラインの背景色をvimの行番号の背景色に引き継ぐ
autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none

"コマンドラインの背景色をSignColumn(syntasticのerr checkが表示されるところ)の背景色に引き継ぐ
autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none

"コマンドラインの背景色をvimの垂直分割ラインの背景色に引き継ぐ
autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none

"コマンドラインの背景色をvimのEOF以降の~などの背景色に引き継ぐ
autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none

" http://h2plus.biz/hiromitsu/wp-content/uploads/2012/07/termcolor.jpg
highlight Comment ctermfg=130 ctermbg=none
highlight Delimiter ctermfg=202 ctermbg=none
highlight Search term=reverse cterm=reverse ctermfg=193 ctermbg=16


" ========================================
" *-- vimdiff --*
" ========================================
" vimdiffの色設定(黒背景用)
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=22
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=52
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
highlight DiffText   cterm=bold ctermfg=10 ctermbg=21


" ========================================================
" *-------- 表示 --------*
" ========================================================
set title  "編集中のファイル名を表示する
set number  "行数の表示
set laststatus=2  "ステータスラインを常に表示
set statusline=%f%m%=%l,%c\ %{'['.(&fenc!=''?&fenc:&enc).']\ ['.&fileformat.']'}  "ステータスラインの内容
set list  "不可視文字の表示
set listchars=tab:>-,trail:_,extends:\  "不可視文字をどのように表示するか
set tabstop=2  "タブの幅
set autoindent  "改行時に自動インデントする
set shiftwidth=2 "自動インデントの文字数
set smartindent  "ネスト時自動的にインデント数を増減
set smarttab  "行頭余白タブでshiftwidthの数だけインデント
set expandtab  "タブの代わりにスペースを使用する
autocmd Filetype json setl conceallevel=0  "jsonのダブルクオーテーションは表示する

"対応括弧のハイライトなし
let loaded_matchparen = 1

" ========================================================
" *-------- 編集 --------*
" ========================================================
set encoding=utf8  "vim自身の文字コード
set fileencoding=utf-8  "ファイル保存時の文字コード
set fileencodings=utf-8  "ファイルを開くときの文字コード
set history=128  "コマンド履歴数
set incsearch  "インクリメンタルサーチ
set hlsearch  "サーチ結果のハイライト
set ignorecase  "検索時に文字の大小を区別しない
set smartcase  "検索時に大文字を含んでいたら大小を区別する
set whichwrap=b,s,h,l,<,>,[,]  "行頭行末で止まらず上下行へ移動できるようになる
set backspace=indent,eol,start  "インサートモード時にバックスペースを使う

"編集位置の記憶
if has("autocmd")
  augroup redhat
    " In text files, always limit the width of text to 78 characters
    autocmd BufRead *.txt set tw=78
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line ("'\"") <= line("$") |
    \   exe "normal! g'\"" |
    \ endif
  augroup END
endif
