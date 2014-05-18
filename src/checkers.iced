
##-----------------------------------------------------------------------

E = (s) -> new Error s
exports.checkers = checkers = {}

##-----------------------------------------------------------------------

checkers.array = check_array = (min = null, max = null) -> (x) ->
  if typeof(x) isnt 'object' or not Array.isArray(x) then E("expected an array")
  else if min? and x.length < min then E("Array must have > #{min} elements")
  else if max? and x.length > max then E("Array must have < #{max} elements")
  else null

##-----------------------------------------------------------------------

checkers.buffer = (min = null, max = null) -> (x) ->
  if typeof(x) isnt 'object' or not Buffer.isBuffer(x) then E("expected a buffer")
  else if min? and x.length < min then E("Buffer must have > #{min} bytes")
  else if max? and x.length > max then E("Buffer must have < #{max} bytes")
  else null

##-----------------------------------------------------------------------

checkers.value = (v) -> (x) ->
  if (a = typeof(v)) isnt (b = typeof(x)) then E("Type mismatch: #{a} != #{b}")
  else if v isnt x then E("Value mismatch: #{v} != #{x}")
  else null

##-----------------------------------------------------------------------

checkers.type = (a) -> (x) ->
  b = typeof(x)
  if a isnt b then E("Type mismatch: wanted #{a} but got #{b}")
  else null

##-----------------------------------------------------------------------

checkers.non_null = () -> (x) ->
  if not x? then E("Got a null value when a non-null value was needed")
  else null

##-----------------------------------------------------------------------

checkers.sparse_array = (template) -> (arr) ->
  err = check_array()(arr)
  unless err?
    for k,v of template
      err = if k < arr.length then v arr[k]
      else new Error "Array too short: len < #{x.length}"
      break if err?
  return err

##-----------------------------------------------------------------------
