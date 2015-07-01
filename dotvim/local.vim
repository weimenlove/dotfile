let g:snips_author = "fantity wei"
let g:snips_company = "^oo^"

function! CleanCSS()
	try
		silent execute "%s/\\t\\+$//g"
	catch
	endtry

	try
		silent execute "%s/[ ]\\+$//g"
	catch
	endtry

	try
		silent execute "%s/\\([^ ]\\){/\\1 {/g"
	catch
	endtry

	try
		silent execute "%s/:\\([^ ]\\)\\(.*\\);/: \\1\\2;/"
	catch
	endtry
endfunction
