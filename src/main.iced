
mods = [
  require('./encode')
  require('./decode')
  require('./parse')
  require('./mime')
  require('./http')
]
for mod in mods
  for k,v of mod
    exports[k] = v
