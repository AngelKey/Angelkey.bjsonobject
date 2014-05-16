
{encode} = require './encode'
{decode,decode_json_obj} = require './decode'
{mime_types,mime_types_r} = require './mime'

#===========================================================================

exports.to_content_type_and_body = ({encoding, obj}) ->
  err = ct = body = null

  encoding or= 'json'

  if encoding in [ 'json', 'msgpack', 'msgpack64' ]
    body = encode { obj, encoding }
    ct = mime_types[encoding]
  else
    err = new Error("unknown encoding: #{encoding}")

  return [err, ct, body]

#===========================================================================


exports.from_content_type_and_body = ({content_type, body}) ->
  ret = err = null
  encoding = mime_types_r[content_type]
  if encoding?
    [err,ret] = decode { buf : body, encoding }
  else
    ret = body
  return [err, ret]

#===========================================================================

