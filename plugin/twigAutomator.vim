" search for all matches between . and |raw
function! Twiggy(reg)
  :normal!  /\(\.\)\zs\(.*\)\ze\(|raw\)/
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
  :normal! ggP
endfunction
command! -register Twiggy call Twiggy(<q-reg>)
