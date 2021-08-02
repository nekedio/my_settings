set number
set mouse=a
set ls=2
set hls "для подсветки поиска, noh чтобы убрать"
set incsearch "для подсветки каждого символа
set smartindent
set tabstop=4
set expandtab
set ai
"set nowrap
colorscheme ron

"--------------- Плагины---------------
"Установка отсюда: https://github.com/junegunn/vim-plug
":PlugClean отчистка
":PlugInastall установка
"При любых изменениях не забываем перезапускать vim

call plug#begin('~/.vim/plugged')

"Подсветка всех языков и верные отступы для них (куча всего встроенного)
Plug 'sheerun/vim-polyglot'

"Отображение отступов для пробельных табов
Plug 'Yggdroot/indentLine'

"Красотульки для командной строки. включить ls=2
Plug 'vim-airline/vim-airline'

"Закрывающая скобка
Plug 'jiangmiao/auto-pairs'

"Коменты выделить gc или gcc
Plug 'tomtom/tcomment_vim'

"Подсветка парных тегов, тормозит если много тегов!
Plug 'Valloric/MatchTagAlways'

"еммет (для html)
Plug 'mattn/emmet-vim'

"древо каталогов
Plug 'preservim/nerdtree'

"Автокомплит с ИИ, весет 800мб. Встанет не с первого раза.
Plug 'zxqfl/tabnine-vim'

Plug 'preservim/tagbar'

call plug#end()" 
"---------------------------------------

"файлы .* определяются как нам нужно
au BufNewFile,BufRead *.phtml set filetype=html
au BufNewFile,BufRead *.blade.php set filetype=html

"снижение тона для вертикальных линий
let g:indentLine_color_term = 59

"Еммет при двойном нажатии на ,
" au BufNewFile,BufRead *.blade.php let g:user_emmet_leader_key=','
let g:user_emmet_leader_key=','

"Включение и отключение древа каталогов кнопкой F2
map <F2> :NERDTreeToggle<CR>
"shift-i показывает скрытые файлы и папки

"s и i открывают файлы на том-же экране.
"t открывает новую вкладку. Перемещение по вкладкам gt и gT

"Переключение между вкладками ctrl-Left и ctrl-Right
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

"Закрывает древо каталогов при закрытии файла
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"Открытие древа каталогов при открытии файла
" autocmd VimEnter * NERDTree
"При открытии курсор в новом файле
"autocmd VimEnter * wincmd p

function! StartUp()
    if 0 == argc()
        NERDTree
    end
endfunction

autocmd VimEnter * call StartUp()



nmap <F8> :TagbarToggle<CR>

"Выйти польностью :qa, :qwa
"Переход между окнами Ctrl-ww млм Ctrl-стрелка
"Обновить каталоги после изменеий R или к
