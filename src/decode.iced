
purepack = require 'purepack'

#=================================================================

exports.decode = decode = ({buf, json, mpack}) ->
  if json then json = true
  else if mpack then json = false
  else json = true

  if json then decode_json buf
  else purepack.unpack buf
  
#=================================================================

exports.decode_json_obj = decode_json_obj = (o) ->

  _to_buffer = (o) ->
    if Object.keys(o).length isnt 1 then null
    else if (b = o.__b)? then new Buffer b, 'base64'
    else if (b = o.__h)? then new Buffer b, 'hex'
    else null

  if typeof(o) isnt 'object' then o
  else if Array.isArray(o) then (decode_json_obj(e) for e in o)
  else if (b = _to_buffer(o)) then b 
  else
    out = {}
    for k,v of o
      out[k] = decode_json_obj v
    out

#=================================================================

decode_json = (buf) ->
  decode_json_obj JSON.parse buf

#=================================================================

