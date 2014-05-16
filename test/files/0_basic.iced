
{prng} = require 'crypto'
{decode,lookup,encode} = require '../../lib/main'

obj = null
eobj = null

#========================================================

exports.encode_json_1  = (T, cb) ->
  obj =
    id : prng(10)
    uid : prng(12)
    foos : [
      10,
      20,
      30,
      prng(40)
    ],
    uids : [
      [prng(3), prng(10),[prng(4), [prng(5)]]],
      prng(20)
    ]
    bars :
      pgp_fingerprint : prng(20)
      buxes : 
        x_id : prng(4)
        y_id : prng(3)
        dog : prng(6)
      dig : 10
      blah : prng(5)
  eobj = encode { obj }
  T.assert eobj?, "it came out"
  tmp = JSON.parse eobj

  keys = [
    "id.__h"
    "uid.__h"
    "foos[3].__b"
    "uids[0][0].__h"
    "uids[0][1].__h"
    "uids[0][2][0].__h"
    "uids[0][2][1][0].__h"
    "uids[1].__h"
    "bars.pgp_fingerprint.__h"
    "bars.buxes.x_id.__h"
    "bars.buxes.y_id.__h"
    "bars.buxes.dog.__b"
    "bars.blah.__b"
  ]

  for k in keys
    T.assert lookup({obj : tmp, key : k }), "path #{k}"
  cb()

#========================================================

exports.decode_json_1 = (T,cb) ->
  out = decode { buf : eobj, json : true }
  T.assert out?, "decode came back"
  T.equal out, obj, "same as before"
  cb()

#========================================================

