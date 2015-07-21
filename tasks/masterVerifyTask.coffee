module.exports = (grunt) ->
  console.log 'masterVerifyTask has been loaded.'

  grunt.registerTask 'verify', 'finds potential unused strings', ->
    #config object
    config = grunt.config 'verify'

    console.log 'generating dead strings file'

    try
      mastObj = require config.src
    catch e
      console.log e


    toCheck = []
    traverse = (obj) ->
      for property of obj
        if typeof obj[property] isnt 'object' or obj[property] is null or obj[property] is undefined
          toCheck.push property
        else if typeof obj[property] is 'object'
          traverse obj[property]
        else

    traverse mastObj

    toCheck.forEach (arg) ->
      grunt.util.spawn {cmd: 'grep', args: [arg, config.path, '-iR']},
      (error, result, code) ->
        console.log code
    console.log toCheck
