
mods = [
  require('./encode')
  require('./decode')
  require('./parse')
  require('./mime')
  require('./http')
  require('./checkers')
  require('./template')
  require('./const')
]
for mod in mods
  for k,v of mod
    exports[k] = v
