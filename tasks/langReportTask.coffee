module.exports = (grunt) ->
  console.log 'langRep has been loaded.'

  grunt.registerTask 'langRep',
  'language report task, used for comparing coffeescipt language object files\n
  options:\n
    -sep will seperate the files\n
    -zip will seperate and zip the files', ->
    languages = ['en', 'fr', 'es', 'it', 'pt', 'ru', 'te', 'zh']

    #valid options
    doZip = grunt.option 'zip'
    doSep = grunt.option 'sep'

    langObj = {}
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

    #returns the coffescript stringified
    convertToCoffee = (obj) ->
      js2coffee = require 'js2coffee'
      source = 'modeule.exports = ' + JSON.stringify(obj, null, 2) + ';'
      result = js2coffee.build source

      #replaceAll
      regex = new RegExp '\'', 'g'
      result.code  = result.code.replace regex, ' '
      return result.code

    results = (doZip, doSep) ->
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
          sourceCode = convertToCoffee langObj[language]
          if doSep
            grunt.file.write "output/seperate/#{language}_nullTranslations.coffee", sourceCode
          else
            zip.file "#{language}_nullTranslations.coffee", sourceCode

        #create the zip file
        if doZip
          console.log 'generating zip file'
          #compression level: 1-9
          content = zip.generate {type:'nodeBuffer', compressionOptions: {level: 9}}
          grunt.file.write 'output/nullTranslations.zip', content

      else
        sourceCode = convertToCoffee langObj
        grunt.file.write 'output/coffee/combined_nullTranslations.coffee', sourceCode

    run = () ->
      console.log 'running...'

      strFlattened = {}
      nullTranslations = []

      for language in languages
        readInObj = require "../strings/#{language}/str"
        traverse readInObj, '', (name, property) ->
          strFlattened[language] = {} if strFlattened[language] is undefined
          strFlattened[language][name] = property

      for key of strFlattened['en']
        for language in languages
          continue if language is 'en'
          nullTranslations.push language + key if strFlattened[language][key] is null or
            strFlattened[language][key] is undefined

      for nullPath in nullTranslations
        parseDotNotation langObj, nullPath

    run()

    results(doZip,doSep)
