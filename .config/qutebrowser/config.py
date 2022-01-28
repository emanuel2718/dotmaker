import os
import subprocess
from qutebrowser.api import interceptor


# ================== DEFAULTS =========================
#config.load_autoconfig(False)

c.auto_save.session = False
c.statusbar.widgets = ['keypress', 'history', 'progress']
#c.statusbar.show = 'in-mode'
c.tabs.title.format = '{private}{current_title}'
c.tabs.show = 'multiple'
c.fonts.web.size.default = 20
c.downloads.location.prompt = True
c.content.autoplay = False
c.editor.command = ['nvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.editor.encoding = 'utf-8'
c.statusbar.position = 'bottom'
c.tabs.background = True
c.tabs.wrap = True
c.confirm_quit = ["downloads"]
c.qt.highdpi = True
c.scrolling.smooth = False
c.tabs.padding = {"left": 5, "right": 5, "top": 0, "bottom": 1}
c.url.start_pages = ['https://start.duckduckgo.com']
c.url.searchengines = {
        'DEFAULT': 'https://duckduckgo.com/?q={}',
        "g": "https://www.google.com/search?hl=en&q={}",
        'r': 'https://www.reddit.com/r/{}/',
        'y': 'https://www.youtube.com/results?search_query={}',
        's': 'https://searx.be/?q={}',
        }
# =====================================================


# ================== REBINDS ==========================
def unbind(key, mode='normal'):
    """ Helper for key unbinds """
    config.unbind(key, mode)

def bind(key, command, mode='normal'):
    """ Helper for key binds """
    config.bind(key, command, mode)

bind('tr', 'config-source')
bind('tm', 'messages --tab')

# NOTE: use go and gO to see or edit the current url
bind('o', 'set-cmd-text -s :open')
bind('O', 'set-cmd-text -s :open --tab')

bind('h', 'history')
bind('`', 'tab-focus last')
bind('gp', 'open -p')
bind('J', 'tab-prev')
bind('K', 'tab-next')
bind("'d", 'spawn --detach mpv "{url}"')
bind("+", 'zoom-in')
bind("_", 'zoom-out')
bind("0", 'zoom 100')
bind('p', 'open --tab -- {clipboard}')
bind('P', 'open -- {clipboard}')


bind('<Ctrl-j>', 'completion-item-focus next', 'command')
bind('<Ctrl-k>', 'completion-item-focus prev', 'command')


unbind("'")

bind("'8", ':open --tab https://8kun.top/index.html')
bind("'n", ':open --tab https://news.ycombinator.com/news')
bind("'r", ':open --tab https://reddit.com/')
bind("'g", ':open --tab https://github.com/emanuel2718')
bind("'y", ':open --tab https://youtube.com')
bind("'p", ':open --tab https://privacytools.io')
bind("'l", ':open --tab localhost:8080')
bind("'w", ':open --tab https://wallhaven.cc/toplist?page=2')
bind("'c", ':open --tab https://cheats.rs/')

# =====================================================




# ================== ALIAS =========================
c.aliases['w'] = 'session-save'
c.aliases['wq'] = 'quit --save'
c.aliases['archive'] = 'open --tab https://web.archive.org/save/{url}'
c.aliases['va'] = 'open --tab https://web.archive.org/web/*/{url}'
c.aliases['gg'] = 'open https://github.com/emanuel2718'
# ==================================================


# ================== Youtube Add Blocking =======================
#def filter_yt(info: interceptor.Request):
#    """Block the given request if necessary."""
#    url = info.request_url
#    if (
#        url.host() == "www.youtube.com"
#        and url.path() == "/get_video_info"
#        and "&adformat=" in url.query()
#    ):
#        info.block()
#
#
#interceptor.register(filter_yt)
# ===============================================================

# ====================== COLORS =======================

c.colors.completion.category.bg = '#1d2021'
c.colors.completion.category.fg = '#d4be98'
c.colors.completion.even.bg = '#1d2021'
c.colors.completion.fg = '#d4be98'
c.colors.completion.item.selected.bg = '#1d2021'
c.colors.completion.item.selected.fg = '#d4be98'
c.colors.completion.odd.bg = '#1d2021'

c.colors.hints.bg = '#1d2021'
c.colors.hints.fg = '#d4be98' 

c.colors.statusbar.command.bg = '#1d2021'
c.colors.statusbar.command.fg = '#d4be98'
c.colors.statusbar.normal.bg = '#1d2021'
c.colors.statusbar.normal.fg = '#d4be98'

c.colors.tabs.even.bg = '#1d2021'
c.colors.tabs.even.fg = '#d4be98'
c.colors.tabs.indicator.stop = '#89b482'
c.colors.tabs.odd.bg = '#1d2021'
c.colors.tabs.odd.fg = '#d4be98'
c.colors.tabs.selected.even.bg = '#32302f'
c.colors.tabs.selected.odd.bg = '#32302f'
# =====================================================



