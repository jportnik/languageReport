module.exports = (grunt) ->
  grunt.registerMultiTask 'verify', 'finds potential unused strings\n**WARNING**\npotential is the key word here, always check before removing', ->
    start = Date.now()

    CSON = require 'cson'
    cp = require 'child_process'

    masterLanguageObj = CSON.requireCSFile @data.master
    include = @data.include
    exclude = @data.exclude

    grepArr = ['-r','-o', null, '.']

    for inc in include
      grepArr.push "--include=./#{inc}"

    for exc in exclude
      grepArr.push "--exclude=./#{exc}"

    flattenedPaths = []

    traverse = (obj, soFar) ->
      for key of obj
        flat = null
        if soFar is ''
          flat = key
        else
          flat = "#{soFar}.#{key}"
        if typeof obj[key] isnt 'object' or not obj[key]?
          flattenedPaths.push flat
        else if typeof obj[key] is 'object'
          traverse obj[key], flat

    # create a flattened array of all the objects keys
    traverse masterLanguageObj, ''

    grepPattern = flattenedPaths.join '\\|'
    grepArr[2] = "\'#{grepPattern}\'"
    grepOutputObj = cp.spawnSync 'grep', grepArr, {encoding: 'utf8'}

    # out is a string with FOUND keys
    out = grepOutputObj.stdout

    # check for keys that were not found
    for str in flattenedPaths
      if out.indexOf(str) is -1
        grunt.log.writeln str
    grunt.log.writeln 'time: ' + (Date.now() - start)
