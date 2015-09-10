module.exports = (grunt) ->
  grunt.registerMultiTask 'langRep',
  'language report task, used for comparing coffeescipt language object files\noptions:\n\tsep will seperate the files\n\tzip will seperate and zip the files', ->

    CSON = require 'cson'

    # valid options
    doSep = grunt.option 'sep'
    doZip = grunt.option 'zip'

    languages = @data.langs
    master = @data.master
    filesObj = {}

    noTranslationLanguageObj = {}
    linefeed = grunt.util.linefeed

    # gets destinations
    destinations = []
    for key of @data.files
      destinations.push key.dest

    filesRead = 0
    @files.forEach (file) ->
      for path in file.src
        filesRead++
        for language in languages
          if (path.indexOf "/#{language}/") > -1
            filesObj[language] = CSON.requireCSFile path
            break

    if filesRead is 0
      grunt.fail.fatal "0 files found."
    else
      grunt.log.writeln "#{filesRead} file(s) found."

    traverse = (obj, path, callback) ->
      for key of obj
        if typeof obj[key] is 'object' and obj[key] isnt null
          subObj = obj[key]
          p = path.concat '.' + key
          traverse subObj, p, callback
        else
          p = path + '.' + key
          callback p, obj[key]

    updateLangObj = (obj, str) ->
      # split apart flattened key
      keys = str.split '.'

      # check if key exist and create it if it doesn't
      for i in [0..keys.length] by 1
        obj[keys[i]] = {} if obj[keys[i]] is undefined
        obj = obj[keys[i]]

    strFlattened = {}

    for language in languages
      grunt.log.writeln "#{language} checked"
      traverse filesObj[language] , '', (name, property) ->
        strFlattened[language] = {} if strFlattened[language] is undefined
        strFlattened[language][name] = property

    for key of strFlattened[master]
      for language in languages
        continue if language is master
        if not strFlattened[language][key]?
          updateLangObj(noTranslationLanguageObj, language + key)

    dest =  @files[0].orig.dest

    writeFile = (objToWrite, fileName) ->
      empty = true

      # checks is the output file(s) are empty
      while empty
        for key of noTranslationLanguageObj
          for property of noTranslationLanguageObj[language]
            empty = false
      sourceCode = "module.exports =#{linefeed}" + CSON.stringify objToWrite
      grunt.file.write fileName, sourceCode
      grunt.log.warn "missing translations found check the output files" if not empty

    zip = () ->
      cp = require 'child_process'
      # can use a library if wanted
      zip = cp.spawnSync 'zip', ['-r', 'nullTranslations.zip', dest]

    seperate = () ->
      for language in languages
        continue if language is master
        writeFile(noTranslationLanguageObj[language], "#{dest}#{language}_nullTranslations.coffee")

    if doSep
      seperate()
    else if doZip
      seperate()
      zip()
    else
      writeFile(noTranslationLanguageObj, "#{dest}combined_nullTranslations.coffee")
