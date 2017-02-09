// map ? to show help information
map('?', 'u');

// an example to remove mapkey `Ctrl-i`
unmap('<Ctrl-i>');

map('h', 'E');
map('l', 'R');

// search engine
addSearchAliasX('y', 'youdao dictionary', 'http://www.youdao.com/w/', 's');
mapkey('oy', '#8Open Search with alias y', 'Front.openOmnibar({type: "SearchEngine", extra: "y"})');

// set theme
settings.theme = '\
.sk_theme { \
    background: #fff; \
    color: #000; \
} \
.sk_theme tbody { \
    color: #000; \
} \
.sk_theme input { \
    color: #000; \
} \
.sk_theme .url { \
    color: #555; \
} \
.sk_theme .annotation { \
    color: #555; \
} \
.sk_theme .focused { \
    background: #f0f0f0; \
}';
