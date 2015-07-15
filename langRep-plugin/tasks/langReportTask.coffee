module.exports = (grunt) ->
  console.log "langRep has been loaded."

  grunt.registerTask "langRep", "language report task, used for comparing \"json language\" files", ->
    languages = ["en", "fr", "es"]

    target = grunt.option "target"
    #console.log "target:" + target

    if target not in languages and target isnt "all"
      grunt.log.error "langRep requires target to be on of [fr, es, all]\nex. grunt langRep --target=fr"
      #break out of the task and stop running
      return

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
      # #print out result
      # console.log "---------- nullTranslations -----------"
      # console.log JSON.stringify langObj, null, 2
      # console.log "---------------------------------------"

      #save result in files
      grunt.file.write "./temp/" + "nullTranslations" + ".json", JSON.stringify(langObj, null, 2)

    run = (target) ->
      console.log "running..."

      strFlattened = {}
      nullTranslations = []

      for language in languages
        if language isnt target and language isnt "en" and target isnt "all"
          #console.log "here:" + language
          continue
        #readInObj = grunt.file.read "./strings/" + language + "/str.coffee"
        readInObj = require "../strings/" + language + "/str"
        console.log language
        traverse readInObj, "", (name, property) ->
          strFlattened[language] = {} if strFlattened[language] is undefined
          strFlattened[language][name] = property

      #console.log strFlattened["en"]

      for key of strFlattened["en"]
        #console.log key
        for language in languages
          continue if language is "en" or language isnt target and target isnt "all"
          nullTranslations.push language + key if strFlattened[language][key] is null or
            strFlattened[language][key] is undefined

      #console.log "null: " + nullTranslations

      for nullPath in nullTranslations
        parseDotNotation langObj, nullPath

    run(target)

    results()
