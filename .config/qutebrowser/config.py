c.auto_save.session = True
c.content.cookies.accept = 'no-3rdparty'
c.content.default_encoding = 'utf-8'
c.downloads.location.suggestion = 'both'
c.downloads.position = 'bottom'
c.editor.command = ['nvim-qt', '--nofork', '--', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.fonts.completion.category = 'bold 11pt monospace'
c.fonts.completion.entry = '11pt monospace'
c.fonts.debug_console = '11pt monospace'
c.fonts.downloads = '11pt monospace'
c.fonts.hints = 'bold 11pt monospace'
c.fonts.keyhint = '11pt monospace'
c.fonts.messages.error = '11pt monospace'
c.fonts.messages.info = '11pt monospace'
c.fonts.messages.warning = '11pt monospace'
c.fonts.monospace = 'monospace'
c.fonts.prompts = '11pt sans-serif'
c.fonts.statusbar = '11pt monospace'
c.fonts.tabs = '11pt monospace'
c.hints.chars = 'aoeuidhtns'
c.scrolling.bar = 'always'
c.tabs.title.format = '{audio}{index}{title_sep}{current_title}'
c.url.searchengines = {
    'DEFAULT': 'https://duckduckgo.com/?q={}',
    'crates': 'https://crates.io/search?q={}',
    'hackage': 'https://hackage.haskell.org/packages/search?terms={}',
    'hoogle': 'https://www.haskell.org/hoogle/?hoogle={}',
    'scry': 'https://scryfall.com/search?q={}',
}
config.bind('X', 'hint links spawn mpv {hint-url}')
config.bind('x', 'spawn mpv {url}')
