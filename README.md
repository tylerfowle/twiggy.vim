# twiggy.vim

twiggy will find all of the content spaces and content blocks in the current
buffer and paste them in their variable blocks.


### Installation:

vim-plug:
```
Plug 'tylerfowle/twiggy.vim'
```


### Usage:

put your cursor where you want to paste, and run
```
:Twiggy
```

### Limitations:

Currently it will only find content blocks in the current buffer, but you can
run it in your `header.twig` and `footer.twig` to grab those blocks quickly
