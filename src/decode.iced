
purepack = require 'purepack'

#=================================================================

exports.decode = decode = ({buf, json, mpack}) ->
  if json then json = true
  else if mpack then json = false
  else json = true

  if json then decode_json buf
  else purepack.unpack buf
  
#=================================================================

rewrite_json_obj = (o) ->
  if typeof(o) isnt 'object' then o
  else if Array.isArray(o) then (rewrite_json_obj(e) for e in o)
  else if (keys = Object.keys o).length is 1 and (b = o.__b)? then new Buffer b, 'base64'
  else
    out = {}
    for k,v of o
      out[k] = rewrite_json_obj v
    out

#=================================================================

decode_json = (buf) ->
  rewrite_json_obj JSON.parse buf

#=================================================================

