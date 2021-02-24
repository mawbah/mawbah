"устанавливаем менеджер плагинов vim-plug, если его ещё нет
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

"плагины под управлением vim-plug
call plug#begin('~/.vim/plugged')
Plug 'vim-scripts/CycleColor'          "для поочерёдного переключения цветовых схем
Plug 'morhetz/gruvbox'                 "цветовая схема gruvbox
Plug 'scrooloose/nerdtree'             "дерево каталогов
Plug 'vim-airline/vim-airline'         "строка состояния внизу окна
"Plug ''
"Plug ''
"Plug ''
"Plug ''
"Plug ''
"Plug ''
"Plug ''
"Plug ''
call plug#end()

"плагин CycleColor +++++++++++++++++++++++++++++++++++++++++++++++++++
map <F11> :CycleColorNext<CR>          "шорткат включения следующей цветовой схемы
map <F10> :CycleColorPrev<CR>          "шорткат включения предыдущей цветовой схемы

"плагин nerdtree +++++++++++++++++++++++++++++++++++++++++++++++++++++
"autocmd VimEnter * NERDTree           "запуск nerdtree при старте vim
autocmd VimEnter * wincmd p            "поместить курсор на открытый файл
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif "выход из vim, если осталось только окно с nerdtree
map <C-n> :NERDTreeToggle<CR>          "шорткат включения/отключения
let NERDTreeShowHidden=1               "показывать скрытые файлы
let g:NERDTreeWinPos = "left"          "позиционирование в окне (слева)

"TODO обновление плагинов раз в день

set nocompatible                       "совместимость с vi. При наличии файла vimrc параметр отключается сам

"кодировка -----------------------------------------------------------
set encoding=utf-8                     "внутренняя кодировка vim
set termencoding=utf-8                 "кодировка терминала
set fileencodings=utf-8,cp1251,koi8-r,ucs-2,cp866 "приоритет кодировок
set ffs=unix,dos,mac                   "приоритет стандартов символов переноса строки

"резервное копирование и своп ----------------------------------------
set backup                             "создавать резервную копию и сохранять её после сохранения изменений в файле
set writebackup                        "создавать резервную копию только до сохранения изменений (если не включен backup).
set backupcopy=auto                    "способ создания резервной копии. yes - копирует и работает с оригиналом, no - копирует и работает с копией, auto - как no, но если на файле линки, то yes.
"set backupdir=~/.backup,/tmp           "директории с файлами резервного копирования 
set swapfile                           "использовать своп-файлы
"set directory=.,~/.vim/swap/           "директории со своп-файлами

"буферы (окна) -------------------------------------------------------
"set bufhidden



set number                             "нумерация строк

set title                              "имя буфера в заголовке терминала

set showcmd                            "показ незавершённых команд в строке состояния

"синтаксис -----------------------------------------------------------
syntax on                              "подсветка синтаксиса
"set t_Co=256                           "использовать 256 цветов
"let python_highlight_all = 1           "подсветка python

"цветовая схема ------------------------------------------------------
"colorscheme blackboard
"colorscheme brogrammer
"colorscheme neverland2
"colorscheme obsidian
"colorscheme papaya
"colorscheme SlateDark
"colorscheme elford
colorscheme pablo
"colorscheme koehler
"colorscheme ubloh
colorscheme gruvbox

"сигнал об ошибке ----------------------------------------------------
set errorbells                         "сигнал об ошибке
set visualbell                         "визуальный сигнал вместо звукового
set t_vb=

"перенос -------------------------------------------------------------
set wrap                               "перенос длинных строк
set linebreak                          "перенос целых слов

"табуляция и пробелы -------------------------------------------------
set tabstop=4                          "длина табуляции в тексте 
set softtabstop=4                      "длина табуляции при добавлении
set smarttab                           "добавление и удаление группы пробелов в начале строки при нажатии таб
set expandtab                          "в режиме вставки заменяет таб пробелами
set shiftwidth=4                       "длина отступов << и >>
set autoindent                         "копирует отступы для следующей строки
set smartindent                        "автоматически вставляет отступы, где надо, копирует их для следующей строки.

"set lz — ленивая перерисовка экрана при выполнении скриптов

"Показываем табы в начале строки точками
"set listchars=tab:··
"set list


set backspace=indent,eol,start
"lightline
"set laststatus=2
"set noshowmode

"поиск ---------------------------------------------------------------
set showmatch
set hlsearch
set incsearch
set ignorecase
"set smartcase — Vim ищет игнорируя регистр если искомое выражение не содержит большие буквы, в противном случае учитывает регистр.

"типы файлов ---------------------------------------------------------
filetype plugin indent on

" фолдинг (сворачивание участков кода) -------------------------------
set foldenable                         "фолдинг
set foldopen=all                       "автооткрытие при заходе в свёртки
set fdm=indent                         "сворачивание по отступам
"set fdm=syntax "сворачивание по файлу подсветки синтаксиса
"set fdm=manual "сворачивание вручную
"set fdm=marker "сворачивания по маркерам
"set fdm=diff   "сворачивается текст, который не изменился 


"автоматическое переключение рабочей папки
set autochdir 

" Ctrl-пробел для автодополнения
"imap <C-space> <C-x><C-o> 


"скобки и кавычки----------------------------------------------------
imap ( ()<LEFT>
imap () ()

imap { {}<LEFT>
imap {<CR> {<CR>}<Esc>O
imap {} {}


"python --------------------------------------------------------------
autocmd BufWrite *.py normal m':%s/\s\+$//e '' "удаляет пробелы перед сохранением
autocmd BufRead *.py set smartindent cimwords =if,elif,else,for,while,try,except,finally,def,class "отступы после ключевых слов

"автозаголовок для нового файла *.py и *.pyw с путем до интерпретатора  и с указанием кодировки
function! BufNewFile_PY()
0put = '#!/usr/bin/env python'
1put = '#-*- coding: utf-8 -*-'
$put =
$put =
normal G
endfunction
autocmd BufNewFile *.py call BufNewFile_PY()
autocmd BufNewFile *.pyw call BufNewFile_PY() 

"" Формат строки состояния
" fileformat - формат файла (unix, dos); fileencoding - кодировка файла;
" encoding - кодировка терминала; TYPE - тип файла, затем коды символа под курсором;
" позиция курсора (строка, символ в строке); процент прочитанного в файле;
" кол-во строк в файле;
"set statusline=%F%m%r%h%w\ [FF,FE,TE=%{&fileformat},%{&fileencoding},%{&encoding}\]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]

"переключение раскладки для режима команд (Ctrl+^)
set keymap=russian-jcukenwin  
set iminsert=0 
set imsearch=0 
highlight lCursor guifg=NONE guibg=Cyan " меняет цвет при альтернативной раскладке

""проверка русской орфографии
"set spell spelllang=ru_yo,en_us

"прочие автозамены и горячие клавиши ---------------------------------
imap jj <ESC>

