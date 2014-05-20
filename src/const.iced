
{Enum} = require('iced-utils').enum

#------------------------------------

exports.C = 
  encodings : new Enum {
    json : 1
    msgpack : 2
    msgpack64 : 3
  }
  version :
    V1 : 1

#------------------------------------
