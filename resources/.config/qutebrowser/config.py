# NOTE: config.py is intended for advanced users who are comfortable
# with manually migrating the config file on qutebrowser upgrades. If
# you prefer, you can also configure qutebrowser using the
# :set/:bind/:config-* commands without having to write a config.py
# file.
#
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html
import catppuccin

config.load_autoconfig(False)
config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')
config.set('content.headers.accept_language', '', 'https://matchmaker.krunker.io/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:149.0) Gecko/20100101 Firefox/149.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {qt_key}/{qt_version} {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}', 'https://gitlab.gnome.org/*')
config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
config.set('content.local_content_can_access_remote_urls', True, 'file:///home/burrs/.local/share/qutebrowser/userscripts/*')
config.set('content.local_content_can_access_file_urls', False, 'file:///home/burrs/.local/share/qutebrowser/userscripts/*')
c.scrolling.smooth = True

config.unbind('q')
config.bind('Q', 'macro-record')
config.bind('<Ctrl-n>', 'completion-item-focus next', mode='command')
config.bind('<Ctrl-p>', 'completion-item-focus prev', mode='command')
config.bind('<Ctrl-y>', 'completion-item-focus next ;; command-accept', mode='command')
# scroll = 3
# config.bind('k', 'scroll up' ++ scroll * ' ;; scroll up', mode='normal')
# config.bind('j', 'scroll down' ++ scroll * ' ;; scroll down', mode='normal')

config.bind('k', 'scroll-px 0 -200', mode='normal')
config.bind('j', 'scroll-px 0 200', mode='normal')

c.tabs.position = 'left'
c.auto_save.session = True
c.colors.webpage.darkmode.enabled = True
catppuccin.setup(c, 'macchiato', True)
c.qt.args = ['disable-features=HardwareMediaKeyHandling']
config.bind('gt', 'tab-focus')
