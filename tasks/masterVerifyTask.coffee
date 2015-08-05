module.exports = (grunt) ->
  console.log 'masterVerifyTask has been loaded.'

  #will create duplicates in the output if you have two keys with the same name
  grunt.registerMultiTask 'verify', 'finds potential unused strings', ->

    CSON = require 'cson'
    sync = require 'child_process'

    mastObj = CSON.requireCSFile @data.master

    #creates the grep command with excluded directories
    grepArr = ['-r', '-m 1', null, @data.dirToSearch]
    for ex in @data.exclude
      grepArr.push "--exclude-dir=#{ex}"

    potentialDead = []

    traverse = (obj) ->
      for property of obj
        if typeof obj[property] isnt 'object' or obj[property] is null or obj[property] is undefined
          # console.log "looking for: #{property}"
          grepArr[2] = property
          grep = sync.spawnSync 'grep', grepArr
          potentialDead.push property if grep.status
        else if typeof obj[property] is 'object'
          traverse obj[property]

    traverse mastObj

    console.log potentialDead
