"{{{ Twiggy
"//##############################################################################
function! Twiggy(reg)

  " incase cursor is on a nonempty line
  normal! o

  " set a mark
  normal! ma

  " create empty lines above and below mark
  " this is important because we use paragraph objects later
  normal! `aO
  normal! `ao

  "// content blocks
  "//##############################################################################

  " search for all blocks
  normal! /\(blocks\.\)\zs\(.*\)\ze\(|raw\)/
  " copy all matches
  let blockhits = []
  %s//\=len(add(blockhits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(blockhits, "\n") . "\n"'

  " paste at top of buffer
  normal! `ao{% set content_blocks = {
  execute 'normal! "'.reg.'p'
  normal! }i}%}

  "// content spaces
  "//##############################################################################

  " search for all spaces
  /\(spaces\.\)\zs\(.*\)\ze\(|raw\)/
  " copy all matches
  let spacehits = []
  %s//\=len(add(spacehits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(spacehits, "\n") . "\n"'

  " paste at top of buffer
  normal! `aO{% set content_spaces = {
  execute 'normal! "'.reg.'p'
  normal! }i}%}

  "// add strings
  "//##############################################################################

  " set new mark
  normal! ma
  " add stuff to cs
  normal! kkvi{:s/$/': fdp_content_spaces.1,
  normal! vi{:s/^/'

  " go to mark
  normal! `a
  " add stuff to cb
  normal! jjvi{:s/$/': fdp_content_spaces.1,
  normal! vi{:s/^/'

  " add a space between the blocks
  normal! `aoma

  " center cursor
  normal! zz

endfunction

command! -register Twiggy silent! call Twiggy(<q-reg>)
"//##############################################################################
" }}}
