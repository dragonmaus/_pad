c.auto_save.session = True
c.content.cookies.accept = 'no-3rdparty'
c.content.default_encoding = 'utf-8'
c.downloads.location.suggestion = 'both'
c.downloads.position = 'bottom'
c.editor.command = ['nvim-qt', '--nofork', '--', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.fonts.contextmenu = 'default_size default_family'
c.fonts.default_family = 'monospace'
c.fonts.web.family.cursive = 'monospace'
c.fonts.web.family.fantasy = 'monospace'
c.fonts.web.family.fixed = 'monospace'
c.fonts.web.family.sans_serif = 'monospace'
c.fonts.web.family.serif = 'monospace'
c.fonts.web.family.standard = 'monospace'
c.hints.chars = 'aoeuidhtns'
c.scrolling.bar = 'always'
c.tabs.title.format = '{audio}{index}{title_sep}{current_title}'
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'crates': 'https://crates.io/search?q={}',
    'derpi': 'https://derpibooru.org/search?q={}',
    'duck': 'https://duckduckgo.com/?q={}',
    'etools': 'https://www.etools.ch/searchSubmit.do?query={}',
    'hackage': 'https://hackage.haskell.org/packages/search?terms={}',
    'hoogle': 'https://www.haskell.org/hoogle/?hoogle={}',
    'scry': 'https://scryfall.com/search?q={}',
}
config.bind('X', 'hint links spawn mpv {hint-url}')
config.bind('x', 'spawn mpv {url}')
config.load_autoconfig(False)
