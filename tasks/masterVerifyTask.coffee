module.exports = (grunt) ->
  console.log 'masterVerifyTask has been loaded.'

  grunt.registerMultiTask 'verify', 'finds potential unused strings', ->
    #config object
    config = grunt.config 'verify'
    CSON = require 'cson'
    mastObj = CSON.requireCSFile @data.master

    grepArr = ['-r', '-m 1', null, @data.dirToSearch]
    for ex in @data.exclude
      grepArr.push "--exclude-dir=#{ex}"

    toCheck = []
    potentialDead = []

    sync = require 'child_process'
    traverse = (obj, sync) ->
      for property of obj
        if typeof obj[property] isnt 'object' or obj[property] is null or obj[property] is undefined
          toCheck.push property
          #console.log "looking for: #{property}"
          grepArr[2] = property
          grep = sync.spawnSync 'grep', grepArr
          potentialDead.push property if grep.status
        else if typeof obj[property] is 'object'
          traverse obj[property], sync
        else

    traverse mastObj, sync, ''

    console.log potentialDead
