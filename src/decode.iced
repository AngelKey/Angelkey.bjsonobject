
purepack = require 'purepack'

#=================================================================

exports.decode = decode = ({buf, json, mpack}) ->
  if json then json = true
  else if mpack then json = false
  else json = true

  if json then decode_json buf
  else purepack.unpack buf
  
#=================================================================

