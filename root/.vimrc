" просматриваем ман-страницы в отдельном окне vim'a с подсвечиванием и т.п.
" Эта директива должна быть в начале файла .vimrc, иначе она перезапишет
" остальные настройки.
"-------------------------------------------------------------------------
" :Man man
"-------------------------------------------------------------------------
" Local mappings:
" CTRL-] Jump to the manual page for the word under the cursor.
" CTRL-T Jump back to the previous manual page.

:runtime! ftplugin/man.vim


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VUNDLE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle - плагин для управления плагинами (и такое бывает). С его помощью
" можно ставить плагины просто указывая их имена в ~/.vimrc.
set nocompatible              " be iMproved, required
filetype off                  " required

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" БАЗОВЫЕ НАСТРОЙКИ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Позволим конфигурационным файлам в проекте изменять настройки vim'a
" Включим чтение конфигурационных файлов .vimrc в текущей директории
"set exrc                                                                     
" Запретим опасные команды в локальных .vimrc файлах (эта опция должна идти
" в вашем ~/.vimrc после запрещаемых команд, таких как write)
set secure
" Запретим создание swap- и backup-файлов
set nobackup
set nowritebackup
set noswapfile
set noundofile
" backspace без глюков
set bs=indent,eol,start
" кодировка по умолчанию
set fileencoding=utf-8
set encoding=utf-8 
set termencoding=utf-8 
set fileencodings=utf8,koi8r,cp1251,cp866,ucs-2le
set fileformat=unix
" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без
" необходимости сохранения каждый раз когда переключаешься между ними
set hidden
" переносить строки
set wrap
" Перенос строк по словам, а не по буквам
set linebreak
" Включение/отключение режима «вклейки» (set paste / set nopaste)
set nopaste
" включаем мыша
"set mouse=a
" принудительно вырубаем мыша
set mouse=
set ttymouse=
" вырубим выполнение команд из открываемого файла
set nomodeline

" Автоматически обновить содержимое
set autoread
autocmd FocusGained * checktime


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ВНЕШНИЙ ВИД
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Отступы пробелами, а не табуляциями, где нужно укажем впециально
set expandtab
" Ширина строки 80 символов (для автопереноса)
"set textwidth=80
set textwidth=0
" Ширина табуляции в колонках
set tabstop=4
set softtabstop=4
" Количество пробелов (колонок) одного отступа
set shiftwidth=4
" Новая строка будет с тем же отступом, что и предыдущая
set autoindent
" Умная расстановка отступов (например, отступ при начале нового блока)
set smartindent
" Подсвечивать синтаксис
"syntax on
" Указывать номера строк
set number
" включение дополнительной информации о статусной строке
set statusline=%<%f%h%m%r\[%{strlen(&ft)?&ft:'none'}]%=format=%{&fileformat}\ file=%{&fileencoding}\ enc=%{&encoding}\ %b\ 0x%B\ %l,%c%V\ %P 
set laststatus=2
" Показывать положение курсора всё время
set ruler
" Включаем bash-подобное дополнение командной строки                            
set wildmode=longest:list,full
" Дополнительная информация в строке состояния
set wildmenu
" Не делать все окна одинакового размера                                        
set noequalalways                                                               
" Высота окон по-умолчанию                                             
set winheight=20
" Ширина окна по-умолчанию
set winwidth=20
" Минимальная высота окна
set winminheight=0
" Минимальная ширина окна
set winminwidth=0
" Показывать незавершённые команды в статусбаре
set showcmd

" Фолдинг
set foldenable
set foldlevel=100
"set foldmethod=indent
"set foldmethod=manual
set foldmethod=syntax
" Колоночка, чтобы показывать плюсики для скрытия блоков кода:
"set foldcolumn=1

" отключаем пищалку и мигание
set t_vb= 
set novisualbell


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256 " 256 colors
"let g:solarized_termcolors=256
set background=dark
set termguicolors
"colorscheme nord

" Подсвечивать колонку, на которой находится курсор
" set cursorcolumn
" Подсвечивать линию текста, на которой находится курсор
set cursorline
" Подсветить максимальную ширину строки
"let &colorcolumn=&textwidth
"let &colorcolumn=80
" переопределение цветов темы



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ПОИСК
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Игнорировать регистр при поиске                                               
set ignorecase
set smartcase
" Подсвечивать поиск                                                            
set hlsearch
" Использовать последовательный поиск                                         
set incsearch


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ЯЗЫКИ
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" С/C++ файлы
" Расставлять отступы в стиле С
autocmd filetype c,cpp set cin
" закомментировать, если нужна документация по методу/классу
autocmd filetype c,cpp setlocal completeopt-=preview

" MAKE-файлы                                                                       
" В make-файлах нам не нужно заменять табуляцию пробелами                          
autocmd filetype make set noexpandtab                                              
autocmd filetype make set nocin

" HTML-файлы                                                                       
" Не расставлять отступы в стиле С в html файлах                                
autocmd filetype html set noexpandtab                                           
autocmd filetype html set nocin                                                 
autocmd filetype html set textwidth=160

" CSS-файлы                                                                     
" Не расставлять отступы в стиле C и не заменять табуляцию пробелами
autocmd filetype css set noexpandtab            
autocmd filetype css set nocin

" PYTHON-файлы
" Не расставлять отступы в стиле С
autocmd filetype python set nocin
" закомментировать, если нужна документация по методу/классу
autocmd filetype python setlocal completeopt-=preview

" SNIPPETS-файлы
autocmd filetype snippets set noexpandtab
autocmd filetype snippets set nocin


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Биндинги, команды и прочее
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

imap <F3> <ESC>:NERDTreeToggle<CR>
map  <F3> :NERDTreeToggle<CR>

imap <F4> <ESC>:TagbarToggle<CR>
map  <F4> :TagbarToggle<CR>

imap <F5> <ESC>:call QuickFixToggle()<CR>
map  <F5> :call QuickFixToggle()<CR>

" TaskList настройки - отобразить список тасков
imap <F6> <ESC>:TaskList<CR>     
map  <F6> :TaskList<CR>     

" По нажатию Ctrl+F проверить поект на ошибки                                   
autocmd filetype c,cpp  map <C-F> :call g:ClangUpdateQuickFix()<CR>
autocmd filetype python map <C-F> :PymodeLint<CR>

" Переключение буферов
imap <F7> <ESC>:bp<CR>
map  <F7> :bp<CR>
imap <S-Left>  <ESC>:bp<CR>
map  <S-Left>  :bp<CR>

imap <F8> <ESC>:bn<CR>
map  <F8> :bn<CR>
imap <S-Right> <ESC>:bn<CR>
map  <S-Right> :bn<CR>

