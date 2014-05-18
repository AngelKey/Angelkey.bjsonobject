
{checkers} = require './checkers'

#-------------------------------------------------------------------------------

E = (path, err) ->
  if err?
    err.message = "At object path '#{path}': #{err.message}"
  return err

#-------------------------------------------------------------------------------

exports.check_template = check = (template, obj, path = "$") ->
  typ = typeof(template)
  if typ is 'function' then E(path, template(obj))
  else if typ is 'undefined' then null
  else if typ isnt 'object' then E(path, checkers.value(template)(obj))
  else if Array.isArray(template)
    if typeof(obj) isnt 'object' or not Array.isArray(obj)
      E(path, new Error "Needed an array")
    else if (a = template.length) > (b = obj.length)
      E(path, new Error "Array too short: #{b} elements but needed #{a}")
    else
      err = null
      for v,i in template
        err = check(v, obj[i], path + "[#{i}]")
        if err? then break
      err 
  else if (template is null)
    if (obj is null) then null else E(path, new Error "expected null")
  else if typeof(obj) isnt 'object' then E(path, new Error "Needed an object")
  else
    err = null
    for k,v of template
      v2 = obj[k] 
      if v? and not v2?
        err = E(path, new Error "No key for #{k}")
      else if v?
        err = check(v, v2, path + ".#{k}")
      break if err?
    err

#-------------------------------------------------------------------------------

