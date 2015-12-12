let g:hybrid_use_Xresources = 1
set background=dark
colorscheme hybrid

" ------------------------------
" Bundle Settings
" ------------------------------
set nocompatible " viとの互換性OFF
filetype off     " ファイル形式の検出を無効にする
set backspace=indent,eol,start

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }

" My Bundles here:
" from github repos
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'tpope/vim-endwise'
NeoBundle 'tpope/vim-rails'
NeoBundle 'vim-ruby/vim-ruby'
NeoBundle 'vim-scripts/Railscasts-Theme-GUIand256color'
NeoBundle 'vim-scripts/surround.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'tpope/vim-obsession'
NeoBundle 'Lokaltog/vim-powerline'

" vim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

call neobundle#end()

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" ------------------------------
" General Settings
" ------------------------------
filetype plugin on            " ファイルタイププラグインを有効にする
filetype indent on            " ファイル形式別インデントを有効にする
set expandtab                 " Tabをスペースに置き換える
set tabstop=2                 " Tabが対応する空白数
set shiftwidth=2              " 自動インデントの各段階における空白数
set autoindent                " 新しい行の開始時にインデントを現在と同じにする
set nobackup                  " バックアップを取らない
set wrap                      " 画面端で折り返す
set hidden                    " 変種中のファイルを保存しないで他ファイルを表示できるようにする
set history=100               " コマンド・検索パターンを履歴に残す
set nrformats=alpha,octal,hex " <C-A>,<C-X>で加減算を可能にする
set notitle
set clipboard+=unnamed
set mouse=a
set ttymouse=xterm2
set browsedir=buffer

" ------------------------------
" Look And Feel Settings
" ------------------------------
set number             " 行番号を表示
set ruler              " ルーラーを表示
set title              " タイトルを表示
set t_Co=256           " 色数指定(256)
syntax on              " 強調表示ON
colorscheme hybrid     " カラースキーマを設定
set ambiwidth=double   " ☆などの記号を正しく表示する
set cmdheight=1        " コマンドラインに使われるスクリーン上の行数
set showcmd            " コマンドをステータスライン(右側)に表示
set wildmenu           " 補完候補を表示
set laststatus=2       " ステータスラインを表示(常にステータスラインを表示)
" ステータスの表示内容を設定
" 左側：カレントファイル (カレントディレクトリ)
" 右側：[修正フラグ][読み込み専用フラグ][ファイルタイプ][プレビューウィンドウフラグ]
"       [エンコーディング][ファイルフォーマット][カーソルの行数, カーソルの列数]
set statusline=%{expand('%:p:t')}\ %<\(%{expand('%:p:h')}\)%=\ %m%r%y%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}[%3l,%3c]
set list               " 不可視文字(タブや行末)を表示する
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%

" ------------------------------
" Search Settings
" ------------------------------
set incsearch  " インクリメンタルサーチを行う
set hlsearch   " 検索結果をハイライトする
set ignorecase " 大文字・小文字を区別しない
set smartcase  " 大文字で検索した場合、大文字・小文字を区別して検索する

" ------------------------------
" Encoding Settings
" ------------------------------
set termencoding=utf-8 " 端末の出力に使用されるエンコーディング(グローバル)
set encoding=utf-8     " Vim内部で使用するエンコーディング(グローバル)
set fileencoding=utf-8 " ファイルのエンコーディング(バッファローカル)
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932 " Vimが表示できるエンコーディングリスト(グローバル)

"------------------------------------
" neocomplete.vim
"------------------------------------
let g:neocomplete#force_overwrite_completefunc = 1
" AutoComplPopを無効にする
let g:acp_enableAtStartup = 0
" neocompleteを有効にする
let g:neocomplete#enable_at_startup = 1
" 補完が自動で開始される文字数
let g:neocomplete#auto_completion_start_length = 3
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplete#enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplete#enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplete#enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplete#min_syntax_length = 3
" neocompleteを自動的にロックするバッファ名のパターン
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" -入力による候補番号の表示
let g:neocomplete#enable_quick_match = 1
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplete#enable_auto_select = 1
"ポップアップメニューで表示される候補の数。初期値は100
let g:neocomplete#max_list = 20

" ------------------------------
" KeyBind Settings
" ------------------------------
" 括弧やクォート入力後に自動で左側に移動する
inoremap {} {}<Left>
inoremap [] []<Left>
inoremap () ()<Left>
inoremap "" ""<Left>
inoremap '' ''<Left>
inoremap <> <><Left>

" 検索結果のハイライトをESC2回押しで消去する
nnoremap <ESC><ESC> :nohlsearch<CR><ESC>
