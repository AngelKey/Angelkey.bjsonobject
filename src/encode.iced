
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
  o2 = rewrite_json_obj obj
  JSON.stringify o2

#=================================================

encode_mpack = ({ obj, encoding }) ->
  o2 = purepack.pack obj
  if encoding? then o2.toString encoding
  else o2

#=================================================

rewrite_json_obj = (o, last_key = null) ->
  if typeof(o) isnt 'object' then o
  else if Array.isArray(o) then (rewrite_json_obj(e, last_key) for e in o)
  else if Buffer.isBuffer(o)
    enc = if not last_key? then 'base64'
    else if last_key in ['uid', 'id', 'fingerprint'] then 'hex'
    else if last_key.match /_(id|fingerprint)$/ then 'hex'
    else 'base64'
    o.toString enc
  else
    out = {}
    for k,v of o
      out[k] = rewrite_json_obj(v,k)
    out

#=================================================

console.log encode { obj : { id : new Buffer([1,2,3,4]), foo_id : [ new Buffer([50,11,34]), 4 ] , jam : new Buffer [44,22,33,44,22,33,22] } }

