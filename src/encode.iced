
purepack = require 'purepack'

#=================================================

exports.encode = encode = ({obj, json, mpack, encoding}) ->
  if json then json = true
  else if mpack then json = false
  else json = true

  if json then encode_json obj
  else encode_mpack { obj, encoding }

#=================================================

encode_json = (obj) ->
  o2 = encode_json_obj obj
  JSON.stringify o2

#=================================================

encode_mpack = ({ obj, encoding }) ->
  o2 = purepack.pack obj
  if encoding? then o2.toString encoding
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

console.log encode { obj : { id : new Buffer([1,2,3,4]), foo_id : [ { shit : new Buffer([33,22,33]) }, new Buffer([50,11,34]), 4 ] , jam : new Buffer [44,22,33,44,22,33,22] } }

