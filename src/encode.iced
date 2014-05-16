
purepack = require 'purepack'

#=================================================

exports.encode = encode = ({obj, encoding}) ->
  encoding or= 'json'
  if encoding in ['msgpack', 'msgpack64'] then encode_msgpack { obj, encoding }
  else encode_json obj

#=================================================

encode_json = (obj) ->
  o2 = encode_json_obj obj
  JSON.stringify o2

#=================================================

encode_msgpack = ({ obj, encoding }) ->
  o2 = purepack.pack obj
  if encoding is 'msgpack64' then o2.toString 'base64'
  else o2

#=================================================

exports.encode_json_obj = encode_json_obj = (o) ->

  _is_hex_key = (key) -> key?.match /(^|_)(fingerprint|u?id)s?$/

  _encode_json_obj = (o, last_key) ->
    if typeof(o) isnt 'object' then o
    else if Array.isArray(o) then (_encode_json_obj(e, last_key) for e in o)
    else if Buffer.isBuffer(o) 
      if _is_hex_key last_key then { __h : o.toString('hex') }
      else { __b : o.toString('base64') }
    else
      out = {}
      for k,v of o
        out[k] = _encode_json_obj(v, k)
      out

  _encode_json_obj o, null

#=================================================

