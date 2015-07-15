module.exports = (grunt) ->
  console.log "langRep has been loaded."

  grunt.registerTask "langRep",
  "language report task, used for comparing coffeescipt language object files\n
  options:\n
    -sep will seperate the files\n
    -zip will seperate and zip the files", ->
    languages = ["en", "fr", "es", "it", "pt", "ru", "te", "zh"]

    #valid options
    doZip = grunt.option "zip"
    doSep = grunt.option "sep"

    langObj = {}
    traverse = (obj, path, callback) ->
      for property of obj
        if typeof obj[property] is "object" and obj[property] isnt null
          subObj = obj[property]
          p = path.concat "." + property
          traverse subObj, p, callback
        else
          p = path + "." + property
          callback p, obj[property]

    parseDotNotation = (obj, str) ->
      keys = str.split "."
      expand obj, keys, 0

    expand = (obj, keys, i) ->
      if i < keys.length
        obj[keys[i]] = {} if obj[keys[i]] is undefined
        obj = obj[keys[i]]
        i++
        expand obj, keys, i

    results = (doZip, doSep) ->
      # #print out result
      # console.log "---------- nullTranslations -----------"
      # console.log JSON.stringify langObj, null, 2
      # console.log "---------------------------------------"

      #save result in files
      if doZip or doSep
        #create seperate files
        for language of langObj
          grunt.file.write "./output/seperate/" + language + "_nullTranslations.json", JSON.stringify(langObj[language], null, 2)
        if doZip
          console.log "zip needs to be implemented"
      else
        grunt.file.write "./output/combined_nullTranslations.json", JSON.stringify(langObj, null, 2)

    run = () ->
      console.log "running..."

      strFlattened = {}
      nullTranslations = []

      for language in languages
        readInObj = require "../strings/" + language + "/str"
        console.log language
        traverse readInObj, "", (name, property) ->
          strFlattened[language] = {} if strFlattened[language] is undefined
          strFlattened[language][name] = property

      #console.log strFlattened["en"]

      for key of strFlattened["en"]
        #console.log key
        for language in languages
          continue if language is "en"
          nullTranslations.push language + key if strFlattened[language][key] is null or
            strFlattened[language][key] is undefined

      #console.log "null: " + nullTranslations

      for nullPath in nullTranslations
        parseDotNotation langObj, nullPath

    run()

    results(doZip,doSep)
