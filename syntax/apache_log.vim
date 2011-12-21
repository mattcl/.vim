" Matt C-L
" syntax for reading apache access logs

" for the logfile
" vim: set ft=apache_log

" don't wrap
set nowrap
set hlsearch

" highlight points of interest
syn match getRequest    +GET+
syn match postRequest   +POST+

syn match notFound             +404+ contained display
syn match notFoundWrapper      +"\s404\s+ contains=notFound

" highlight the time
syn match timestamp     "[0-9]\{1,2}/[A-Za-z]\{3}/[0-9]\{4}\(:[0-9]\{1,2}\)\{3}"

" highlight the requested url
syn region requestedUrl     start="\s/"hs=e+1 end="\sHTTP"he=s-1

" The next two instructions match a number greater than or equal to 1000000
" when it follows an ip address. The end effect is that it will higlight
" a request that takes at least a second to complete
syn match longerThanOneSecond  "\([0-9]\{6,}\)" contained display
syn match longRequest          "^\([0-9]\{1,3}\.*\)\{4}\s\([0-9]\{7,}\)" contains=longerThanOneSecond

" assign colors
highlight link getRequest           ApacheGET
highlight link postRequest          ApachePOST
highlight link notFound             Apache404
highlight link requestedUrl         ApacheUrl
highlight link timestamp            ApacheTimestamp
highlight link longerThanOneSecond  ApacheLongResponse

" define colors to be consitent regardless of vimrc
hi Normal               ctermfg=244 guifg=#808080 ctermbg=234 guibg=#1c1c1c cterm=none gui=none
hi ApacheUrl            ctermfg=150 guifg=#afdf87
hi ApacheTimestamp      ctermfg=229 guifg=#ffffaf
hi ApachePOST           ctermfg=182 guifg=#dfafdf                           cterm=none
hi ApacheGET            ctermfg=146 guifg=#afafdf                           cterm=none gui=none
hi Apache404            ctermfg=15  guifg=#ffffff ctermbg=1   guibg=#800000
hi ApacheLongResponse   ctermfg=0   guifg=#000000 ctermbg=184 guibg=#dfdf00
