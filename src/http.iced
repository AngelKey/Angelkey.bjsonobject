
{decode, decode_json_obj, encode} = require './encode'
{mime_types} = require './mime'

#===========================================================================

exports.to_content_type_and_body = ({encoding, obj}) ->
  err = ct = body = null
  encoding or= 'json'
  body = switch encoding
    when 'json'      then encode({obj, json : true }) 
    when 'msgpack'   then encode({obj, msgpack : true, encoding : 'binary' })
    when 'msgpack64' then encode({obj, msgpack : true, encoding : 'base64' })
    else null
  if body? then ct = mime_types[encoding]
  else err = new Error("unknown encoding: #{encoding}")
  return [err, ct, body]

#===========================================================================

exports.from_content_type_and_body = ({content_type, body}) ->
  nb = err = null
  try
    nb = switch content_type
      when mime_types.json      then decode_json_obj body
      when mime_types.msgpack   then decode { buf : body, msgpack : true }
      when mime_types.msgpack64 then decode { buf : body, msgpack : true, encoding : 'base64' }
      else null
  catch e
    err = new Error "Error decoding output: #{e.message}"
  return [err, (nb or body)]

#===========================================================================

