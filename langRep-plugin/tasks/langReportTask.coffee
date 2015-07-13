module.exports = (grunt) ->
  console.log "langRep has been loaded."

  grunt.registerTask "langRep", "language report task, used for comparing \"json language\" files", ->
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

    results = () ->
      console.log "---------- nullTranslations -----------"
      console.log JSON.stringify langObj, null, 2
      console.log "---------------------------------------"

    run = () ->
      languages = ["en", "fr", "es"]
      strFlattened = {}
      nullTranslations = []


      for language in languages
        jsonObj = grunt.file.readJSON "/Users/jackmaloney/tasks/strings/" + language + ".json"
        #console.log jsonObj
        traverse jsonObj, "", (name, property) ->
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

    results()
