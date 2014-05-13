
#===========================================================

exports.parse_key = parse_key = (key) ->

  err = null

  # First split into dict keys
  tmp = ({ type : 'dict', key : k } for k in key.split /\./)

  out = []

  # Now deal with array indices, like 'foo[3][50][1]'
  for item in tmp
    if not (m = item.key.match /^([^[]*)((?:\[.+?\])+)(.*)$/)
      out.push item
    else if m[3].length
      err = new Error "found junk in key: #{m[3]}"
    else
      if m[1]? and m[1].length
        item.key = m[1]
        out.push item
      indices = m[2][1...-1].split /\]\[/
      for index in indices
        if index.match /^\d+$/
          out.push { type : 'array', key : parseInt(index, 10) }
        else
          err = new Error "bad array index: #{index}"
          break

  out = null if err?
  return [err, out]

#=============================================================

exports.lookup = lookup = ({obj, key}) ->
  [err, path] = parse_key key
  loc = ""
  i = 0
  while obj? and not err? and i < path.length
    front = path[i++]
    obj = if typeof(obj) isnt 'object' then null
    else if Array.isArray(obj) 
      if front.type is 'array' then obj[front.key]
      else null
    else
      if front.type is 'dict' then obj[front.key]
      else null
  return obj

#=============================================================

obj = { a : [ { b : [ 3, { c: "dog" }]}]}
console.log lookup { obj, key : "a[0].b[1].c" }
