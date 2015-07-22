module.exports = (grunt) ->
  console.log 'masterVerifyTask has been loaded.'

  grunt.registerTask 'verify', 'finds potential unused strings', ->
    #config object
    config = grunt.config 'verify'

    console.log 'generating dead strings file'

    try
      mastObj = require config.master
    catch e
      grunt.warn 'Oops, could not find your master object file, check the path again.'

    toCheck = []
    potentialDead = []

    sync = require 'child_process'
    traverse = (obj, sync) ->
      for property of obj
        if typeof obj[property] isnt 'object' or obj[property] is null or obj[property] is undefined
          toCheck.push property
          #console.log "looking for: #{property}"
          grep = sync.spawnSync 'git', ['grep', '-F', property]
          #console.log grep.output.toString 'utf8'
          #console.log grep.status
          potentialDead.push property if grep.status
        else if typeof obj[property] is 'object'
          traverse obj[property], sync
        else

    traverse mastObj, sync

    console.log potentialDead
