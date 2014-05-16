
exports.mime_types = mime_types = 
  json : "application/json"
  msgpack : "application/x-msgpack"
  msgpack64 : "application/x-msgpack-64"

exports.accept = (k for k,v of mime_types)

# make a reverse lookup too
exports.mime_types_r = mime_types_r = {}
mime_types_r[v] = k for k,v of mime_types
