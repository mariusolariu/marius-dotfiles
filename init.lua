local hyper = { "cmd", "alt", "ctrl", "shift" }
hs.hotkey.bind(hyper, "0", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded, Marius!"}):send()


local applicationHotkeys = {
  a = 'Intellij IDEA',
  c = 'Google Chrome',
  s = 'Spotify',
  d = 'iTerm',
  q = 'Pomotroid',
  w = 'Microsoft Outlook',
  e = 'Tower',
  z = 'Slack',
  x = 'Visual Studio Code',
  v = 'MySQLWorkbench',
  t = 'Microsoft Teams',
  f = 'Finder',
  p = 'System Preferences',
  h = '1Password 7',
  r = 'Preview',
  g = 'Microsoft Word',
  b = 'Safari',
  y = 'YouTube Music Desktop App'
}
-- it doesn't work to launch programs from system preferences, look into it

for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end
