
purepack = require 'purepack'

#=================================================

exports.encode = encode = ({obj, json, mpack, base64}) ->
  if json then json = true
  else if mpack then json = false
  else json = true

  if json
    last_key = null

    replacer = (key, value) ->
      if typeof(key) is 'number' then key = last_key
      else if typeof(key) is 'string' then last_key = key
      ret = if (typeof(value) isnt 'object') or not(Buffer.isBuffer(value)) 
        console.log "missged it!"
        console.log value
        value
      else if (key in ['uid', 'id', 'fingerprint']) or key.match /_(id|fingerprint)$/ then value.toString('hex')
      else value.toString 'base64'
      console.log "foo #{key},  #{value}"
      console.log ret
      ret

    console.log "shit"
    JSON.stringify obj, replacer
  else
    out = purepack.pack obj
    out.toString 'base64' if base64

#=================================================

console.log encode { obj : { id : new Buffer([1,2,3,4]), foo_id : [ new Buffer([50,11,34]), 4 ] } }

