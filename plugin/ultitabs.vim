function! Tabclose(...)
	if a:0 == 0 | tabonly
	" Taken from https://github.com/vim-scripts/tabops to avoid dependence
	elseif index(['<', 'l', 'left'], a:1) >= 0
		for i in range(tabpagenr() - 1, 1, -1)
			execute 'tabclose! ' . string(i)
		endfor
	elseif index(['>', 'r', 'right'], a:1) >= 0
		for i in range(tabpagenr('$'), tabpagenr() + 1, -1)
			execute 'tabclose! ' . string(i)
		endfor
	else
		function! CloseTabs(tabs)
			for tab in reverse(sort(copy(a:tabs)))
				execute "tabclose" tab
			endfor
		endfunction

		if a:1[1] == '-' | call CloseTabs(range(a:1[0], a:1[2]))
		else
			if a:0 == 1 | let tabs = split(tr(a:1, ",", " "))
			else | let tabs = a:000 | endif
			call CloseTabs(tabs)
		endif
	endif
endfunction

command -nargs=* Tabclose call Tabclose(<f-args>)
cabbrev tabclose Tabclose

" Go to tab by number
for i in range(1, 9) | execute "nnoremap <leader>".i." ".i."gt" | endfor
nnoremap <leader>0 <cmd>tablast<return>

" Go to next and previous tabs with `Tab` and `Shift-Tab` respectively
nmap <tab> <cmd>tabnext<return>
nmap <s-tab> <cmd>tabprevious<return>

" Change indent level in insert mode with `Tab` and `Shift-Tab` respectively
inoremap <tab> <c-t>
inoremap <s-tab> <c-d>

" Tabularize
if exists(":Tabularize") | noremap <leader><tab> :Tabularize | endif

" Airline
try
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#tabline#formatter = 'unique_tail'

	function! LineNumber()
		return substitute(line('.'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g'). ' | '.
					\substitute(line('$'), '\d\@<=\(\(\d\{3\}\)\+\)$', ',&', 'g')
	endfunction

	call airline#parts#define('linenr', {'function': 'LineNumber', 'accents': 'bold'})

	let g:airline_section_z = airline#section#create(['%3p%%: ', 'linenr', ':%3v'])
	let g:airline#extensions#tabline#tab_nr_type = 1

	autocmd vimenter * set showtabline=1
catch | endtry
