
{checkers,check_template} = require '../../lib/main'
{prng} = require 'crypto'

#========================================================

obj = null
eobj = null

#========================================================

exports.init = (T,cb) ->
  obj =
    alice :
      buf : prng(10)
      ints : [1,2,30,4]
      strings : ["hi", "bye" ]
    bob :
      charlie :
        buzz : prng(40)
        values : [10,20,30]
      dean : "lewis"
      ellie : null
  cb()

#========================================================

exports.check_1 = (T,cb) ->

  template = {
    alice : {
      buf : checkers.buffer(5,20)
      ints : [ undefined, 2, checkers.type('number'), 4]
    },
    bob : {
      charlie : {
        buzz : checkers.buffer(39)
      },
      dean : checkers.type('string')
      ellie : null
    }
  }

  # this one should work!
  err = check_template template, obj
  T.no_error err
  cb()


#========================================================

exports.check_2 = (T,cb) ->

  template = alice : bob : joe : 0
  err = check_template template, obj
  T.assert err?, "got an error back"
  T.equal err.message, "At object path '$.alice': No key for bob", "the right error message"
  cb()

#========================================================

exports.check_3 = (T,cb) ->

  template = {
    alice : {
      ints : checkers.sparse_array { 2: checkers.value(30) } 
    }
  }
  err = check_template template, obj
  T.no_error err
  cb()

#========================================================

