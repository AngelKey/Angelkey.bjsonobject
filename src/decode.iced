
purepack = require 'purepack'
{C} = require('./const')

#=================================================================

exports.decode = decode = ({buf, encoding}) ->
  encoding or= 'json'
  if encoding is 'json' then decode_json buf
  else if encoding in [ 'msgpack', 'msgpack64' ] then decode_msgpack { buf, encoding }
  else [ new Error("unknown encoding type: #{encoding}"), null ]

#================================================================================

exports.self_describing_decode = ({buf}) ->
  obj = null
  err = if buf.length < 3 then new Error "Need buffer >= 3 bytes long"
  else if buf[0] isnt C.version.V1 then new Error "Can only handle V1"
  else if not (encoding = C.encodings.lookup[buf[1]])?
    new Error "Unknown encoding type: #{buf[1]}"
  else
    [err, obj] = decode { buf : buf[2...], encoding }
    err
  return [err, obj]

#================================================================================

decode_msgpack = ( {buf, encoding} ) ->
  err = ret = null

  if encoding is 'msgpack64' 
    s = if Buffer.isBuffer(buf) then buf.toString('utf8') else buf
    buf = new Buffer s, 'base64'
    if buf.length is 0
      err = new Error "Bad-base64 encoding"

  unless err?
    try
      ret = purepack.unpack buf
    catch e
      err = e
  return [err, ret]
  
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
  err = ret = null
  try 
    obj = JSON.parse buf
  catch e
    err = new Error "Error parsing JSON: #{e.message}"
  ret = decode_json_obj(obj) unless err?
  return [err, ret]

#=================================================================

