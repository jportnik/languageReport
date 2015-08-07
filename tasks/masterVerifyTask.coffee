module.exports = (grunt) ->
  #will create duplicates in the output if you have two keys with the same name
  grunt.registerMultiTask 'verify', 'finds potential unused strings', ->
    start = Date.now()

    CSON = require 'cson'
    sync = require 'child_process'

    mastObj = CSON.requireCSFile @data.master
    include = @data.include
    exclude = @data.exclude
    toSearch = @data.toSearch

    grepArr = ['-r', null, toSearch]

    for inc in include
      grepArr.push "--include=#{inc}"

    for exc in exclude
      grepArr.push "--exclude=#{exc}"

    potentialDead = []

    traverse = (obj, soFar) ->
      for property of obj
        flat = null
        if soFar is ''
          flat = property
        else
          flat = "#{soFar}.#{property}"
        if typeof obj[property] isnt 'object' or not obj[property]?
          # console.log "looking for: flat"
          grepArr[1] = flat
          grep = sync.spawnSync 'grep', grepArr
          switch grep.status
            when 1 then potentialDead.push flat
            when 2 then console.log 'an error occured with grep'
            else
        else if typeof obj[property] is 'object'
          traverse obj[property], flat

    traverse mastObj, ''

    console.log potentialDead
    console.log 'time: ' + (Date.now() - start)
