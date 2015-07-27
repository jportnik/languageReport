module.exports = (grunt) ->
  console.log 'langRep has been loaded.'

  grunt.registerMultiTask 'langRep',
  'language report task, used for comparing coffeescipt language object files\n
  options:\n
    sep will seperate the files\n
    zip will seperate and zip the files', ->

    #valid options
    doSep = grunt.option 'sep'
    doZip = grunt.option 'zip'

    #config object
    config = grunt.config 'langRep'

    languages = @data.langs
    filesObj = {}
    CSON = require 'cson'

    @files.forEach (file) ->
      for language in languages
        if ~(file.src[0]).indexOf "/#{language}/"
          filesObj[language] = CSON.requireCSFile file.src[0]
          break

    langObj = {}
    toObj = (file, cur, obj) ->

    traverse = (obj, path, callback) ->
      for property of obj
        if typeof obj[property] is 'object' and obj[property] isnt null
          subObj = obj[property]
          p = path.concat '.' + property
          traverse subObj, p, callback
        else
          p = path + '.' + property
          callback p, obj[property]

    parseDotNotation = (obj, str) ->
      keys = str.split '.'
      expand obj, keys, 0

    expand = (obj, keys, i) ->
      if i < keys.length
        obj[keys[i]] = {} if obj[keys[i]] is undefined
        obj = obj[keys[i]]
        i++
        expand obj, keys, i

    results = (doZip, doSep, dest) ->
      # #print out result
      # console.log '---------- nullTranslations -----------'
      # console.log JSON.stringify langObj, null, 2
      # console.log '---------------------------------------'

      #save result in files
      if doZip or doSep
        JSZip = require 'jszip'

        zip = new JSZip
        #create seperate files
        for language of langObj
          sourceCode = 'module.exports =\n' + CSON.stringify langObj[language]
          #sourceCode = 'module.exports = \n' + langObj[language]
          if doSep
            grunt.file.write "#{dest}seperate/#{language}_nullTranslations.coffee", sourceCode
          else
            zip.file "#{language}_nullTranslations.coffee", sourceCode

        #create the zip file
        if doZip
          console.log 'generating zip file'
          #compression level: 1-9
          content = zip.generate {type:'nodeBuffer', compressionOptions: {level: 9}}
          grunt.file.write "#{dest}nullTranslations.zip", content

      else
        sourceCode = 'module.exports =\n' + CSON.stringify langObj[language]
        grunt.file.write "#{dest}combined_nullTranslations.coffee", sourceCode

    run = (master) ->
      console.log 'running...'

      strFlattened = {}
      nullTranslations = []

      for language in languages
        console.log "#{language} checked"
        traverse filesObj[language] , '', (name, property) ->
          strFlattened[language] = {} if strFlattened[language] is undefined
          strFlattened[language][name] = property

      for key of strFlattened[master]
        for language in languages
          continue if language is config.master
          nullTranslations.push language + key if strFlattened[language][key] is null or
            strFlattened[language][key] is undefined

      for nullPath in nullTranslations
        parseDotNotation langObj, nullPath

    run(@data.master)

    results(doZip, doSep, @files[0].orig.dest)
