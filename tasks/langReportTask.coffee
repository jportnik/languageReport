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
    langObj = {}

    i = 0
    @files.forEach (file) ->
      i++
      for language in languages
        if ~(file.src[0]).indexOf "/#{language}/"
          filesObj[language] = CSON.requireCSFile file.src[0]
          break

    if not i
      grunt.fail.fatal "0 files found."
    else
      console.log "#{i} file(s) found."

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
      # # print out result
      # console.log '---------- nullTranslations -----------'
      # console.log JSON.stringify langObj, null, 2
      # console.log '---------------------------------------'

      #save result in files
      if doZip or doSep
        JSZip = require 'jszip'

        zip = new JSZip
        # create seperate files
        for language of langObj
          sourceCode = 'module.exports =\n' + CSON.stringify langObj[language]
          if doSep
            grunt.file.write "#{dest}seperate/#{language}_nullTranslations.coffee", sourceCode
          else
            zip.file "#{language}_nullTranslations.coffee", sourceCode

        # create the zip file
        if doZip
          console.log 'generating zip file'
          # compression level: 1-9
          content = zip.generate {type:'nodeBuffer', compressionOptions: {level: 9}}
          grunt.file.write "#{dest}nullTranslations.zip", content

      else
        sourceCode = 'module.exports =\n' + CSON.stringify langObj
        grunt.file.write "#{dest}combined_nullTranslations.coffee", sourceCode

    run = () ->
      console.log 'running...'

      strFlattened = {}

      for language in languages
        console.log "#{language} checked"
        traverse filesObj[language] , '', (name, property) ->
          strFlattened[language] = {} if strFlattened[language] is undefined
          strFlattened[language][name] = property

      for key of strFlattened[master]
        for language in languages
          continue if language is master
          parseDotNotation langObj, language + key if not strFlattened[language][key]?

    run()

    results(doZip, doSep, @files[0].orig.dest)
