
{prng} = require 'crypto'
{self_describing_decode,self_describing_encode} = require '../../lib/main'

obj = null
eobj = null

#========================================================

exports.init = (T,cb) ->

  obj =
    id : prng(10)
    uid : prng(12)
    foos : [10, 20, 30, prng(40) ],
    uids : [[prng(3), prng(10),[prng(4), [prng(5)]]], prng(20) ]
    bars :
      pgp_fingerprint : prng(20)
      buxes : 
        x_id : prng(4)
        y_id : prng(3)
        dog : prng(6)
      dig : 10
      blah : prng(5)
  cb()

#========================================================

sde = (T,encoding,cb) ->
  buf = self_describing_encode { obj, encoding }
  T.assert buf?, "got an encoding"
  [err, out] = self_describing_decode { buf }
  T.no_error err
  T.equal obj, out, "object came back"
  cb()

#========================================================

exports.self_describing_encode_json = (T,cb) -> sde T, 'json', cb
exports.self_describing_encode_msgpack = (T,cb) -> sde T, 'msgpack', cb
exports.self_describing_encode_msgpack64 = (T,cb) -> sde T, 'msgpack64', cb

#========================================================
