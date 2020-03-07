c.auto_save.session = True
c.content.cookies.accept = 'no-3rdparty'
c.content.default_encoding = 'utf-8'
c.downloads.location.suggestion = 'both'
c.downloads.position = 'bottom'
c.editor.command = ['nvim-qt', '--nofork', '--', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.fonts.completion.category = 'bold 10pt monospace'
c.fonts.completion.entry = '10pt monospace'
c.fonts.debug_console = '10pt monospace'
c.fonts.downloads = '10pt monospace'
c.fonts.hints = 'bold 10pt monospace'
c.fonts.keyhint = '10pt monospace'
c.fonts.messages.error = '10pt monospace'
c.fonts.messages.info = '10pt monospace'
c.fonts.messages.warning = '10pt monospace'
c.fonts.prompts = '10pt monospace'
c.fonts.statusbar = '10pt monospace'
c.fonts.tabs = '10pt monospace'
c.hints.chars = 'aoeuidhtns'
c.scrolling.bar = 'always'
c.tabs.title.format = '{audio}{index}{title_sep}{current_title}'
c.url.searchengines = {
    'DEFAULT': 'https://www.etools.ch/searchSubmit.do?query={}',
    'crates': 'https://crates.io/search?q={}',
    'duck': 'https://duckduckgo.com/?q={}',
    'hackage': 'https://hackage.haskell.org/packages/search?terms={}',
    'hoogle': 'https://www.haskell.org/hoogle/?hoogle={}',
    'scry': 'https://scryfall.com/search?q={}',
}
config.bind('X', 'hint links spawn mpv {hint-url}')
config.bind('x', 'spawn mpv {url}')
