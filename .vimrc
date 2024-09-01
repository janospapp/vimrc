highlight ExtraWhitespace ctermbg=red guibg=darkgreen
match ExtraWhitespace /\s\+$\| \+\ze\t/
set tabstop=4
set shiftwidth=4
set expandtab
set listchars=tab:>-
set list
set number
set rnu

autocmd FileType html setlocal ts=2 sw=2
autocmd FileType json setlocal ts=2 sw=2
autocmd FileType ruby setlocal ts=2 sw=2
autocmd FileType yaml setlocal ts=2 sw=2

set tags=./tags;/
set ignorecase

syntax on
filetype plugin indent on
set nowrap
set encoding=utf8
colorscheme nord

nmap <C-n> :NERDTreeToggle<CR>
nmap <leader>j :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeWinSize=45
let NERDTreeChDirMode=2

let g:vimux_ruby_clear_console_on_run = 0
let g:vimux_ruby_file_relative_paths = 1
let g:tmux_navigator_disable_when_zoomed = 1
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:airline_theme='deus'

" Storing swap files in a separate directory
set dir=~/.vim/swp//

" Searching files and text
nmap <C-p> :Files<CR>
nmap <C-f> :Rg<CR>
nmap <C-b> :Buffers<CR>
" Searching for the current word under the cursor
nmap <leader>f :Rg \b<C-R><C-W>\b<CR>

" Toggling the quickfix window with Ctrl+x
function! ToggleQuickFix()
    if empty(filter(getwininfo(), 'v:val.quickfix'))
        copen
    else
        cclose
    endif
endfunction

nnoremap <C-x> :call ToggleQuickFix()<CR>

" Configure ALE options
let g:ale_set_highlights = 0
let g:ale_completion_enabled = 1

let g:ale_ruby_rubocop_executable = 'bundle'
let g:ale_ruby_rubocop_options = '-c .rubocop.yml'

let g:ale_linters = {
\  'ruby': ['solargraph', 'rubocop'],
\}

let g:ale_fixers={
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  'ruby': ['standardrb', 'rubocop'],
\}

nmap gd :ALEGoToDefinition<CR>

packloadall
silent! helptags ALL

" Arpeggio mappings
Arpeggio noremap vi :VimuxInspectRunner<CR>
Arpeggio noremap vp :VimuxPromptCommand<CR>
Arpeggio noremap vl :VimuxRunLastCommand<CR>
Arpeggio noremap rti :RunRubyFocusedTest<CR>
Arpeggio noremap rtc :RunRubyFocusedContext<CR>
Arpeggio noremap rtf :RunAllRubyTests<CR>
Arpeggio noremap rta :VimuxRunCommand("rspec")<CR>

source $HOME/.vim/scripts/rails.vim
nmap gs :call rails#ToggleSpecFile()<CR>
