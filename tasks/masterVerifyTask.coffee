module.exports = (grunt) ->
  grunt.registerMultiTask 'verify', 'finds potential unused strings\n**WARNING**\npotential is the key word here, always check before removing', ->
    start = Date.now()

    CSON = require 'cson'
    cp = require 'child_process'
    os = require 'os'
    fs = require 'fs'
    tmp = os.tmpdir()

    masterLanguageObj = CSON.requireCSFile @data.master
    include = @data.include
    exclude = @data.exclude

    grepArr = ['-r','-o', "--file=#{tmp}keys.txt", '.']

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

    sourceCode = flattenedPaths.join '\n'
    grunt.file.write "#{tmp}keys.txt", sourceCode

    grepOutputObj = cp.spawnSync 'grep', grepArr, {encoding: 'utf8'}

    if grepOutputObj.status > 1
      grunt.fail.fatal CSON.stringify grepOutputObj

    # out is a string with FOUND keys
    out = grepOutputObj.stdout

    # check for keys that were not found
    for str in flattenedPaths
      if out.indexOf(str) is -1
        grunt.log.writeln str

    fs.unlinkSync "#{tmp}keys.txt"
    grunt.log.writeln 'time: ' + (Date.now() - start)
