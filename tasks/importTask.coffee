module.exports = (grunt) ->
  grunt.registerMultiTask 'import', 'imports new translations and combines with an existing string file then outputs to given destination', ->
    CSON = require 'cson'
    extend = require 'extend'
    transArr = grunt.file.expand @data.trans
    # -q to suppress errors
    quiet = grunt.option 'q'
    # used so that @ can be accessed correctly below
    config = @

    # change this flag to get more information during run time
    DEV = false


    # get master language
    mastObj = {}
    for file in config.files
      if ~(file.src[0]).indexOf "/#{@data.master}/"
        mastObj = CSON.requireCSFile file.src[0]
        dest = file.dest
        flag = 0
        break

    transArr.forEach (trans) ->
      imported = grunt.file.read trans
      min = (imported.split '\'')[0].length
      language = (imported.split '\'')[1]
      # checks is language exists, if not throws error and exits
      flag = 1
      langObj = {}
      dest = null
      for file in config.files
        if ~(file.src[0]).indexOf "/#{language}/"
          langObj = CSON.requireCSFile file.src[0]
          dest = file.dest
          flag = 0
          break

      grunt.fail.fatal "The language: #{language} file doesn't exist" if flag

      # 0 = parsing through object key
      # 1 = looking for start of string after ':'
      # 2 = parsing the value string or inline property
      newStr = 0
      importHandled = ''
      currentSpaces = 0
      previousSpaces = 0
      smallerEqual = false
      lastChar = ''
      skip = false

      # RETURNS: true if char is 'special' else false
      isSpecial = (char) ->
        switch char
          when '\n' then return true
          when '\r' then return true
          when ' ' then return true
          when ':' then return true
          when '：' then return true
          else return false

      # RETURNS: trus if char is q 'quote' else false
      isQuote = (char) ->
        switch char
          when '\'' then return true
          when '\"' then return true
          when '‘' then return true
          when '’' then return true
          else return false

      # creates spaces that go in from of the property
      # RETURNS: string of spaces
      createSpaces = (spaces) ->
        spaceStr = ''
        for i in [0..spaces] by 1
          spaceStr += ' '
        return spaceStr

      # adds newline and leading spaces to importHandled string and
      # handles a case where the current line is indented too far
      # handles a case where there are no quotes after an assumed proprty with type str
      leadingSpaceHandler = () ->
        currentSpaces++
        if nextChar isnt ' '
          if smallerEqual and currentSpaces > previousSpaces
            spaceStr = createSpaces(previousSpaces)
            currentSpaces = previousSpaces
          else
            spaceStr = createSpaces(currentSpaces)
          if lastChar is ':' and currentSpaces <= previousSpaces
            importHandled += "''" + '\n' + spaceStr
          else
            importHandled += '\n' + spaceStr

          smallerEqual = false
          previousSpaces = currentSpaces
          currentSpaces = 0

      # handles issues with missing quotes at the end of lines
      # NOTE: doesn't add new lines, that is done in leadingSpaceHandler
      newLineHandler = () ->
        # if we have '\r' it is before '\n' so go back one more char
        if prevChar is '\r' then lastChar = imported[i-2] else lastChar = prevChar

        if newStr is 2
          if prevChar is "'" and isSpecial(imported[i-2])
            importHandled += "'"
          else if prevChar isnt "'"
            importHandled += "'"
          else
        newStr = 0

      # handles issues with the colon and if the next chars are a new obj
      # or a value to a proprety
      colonHandler = () ->
        importHandled += ':'
        newStr = 1
        if nextChar is '\r' or nextChar is '\n'
          smallerEqual = false
        else
          smallerEqual = true

      # just a bunch of cases that need to be handled
      handleSuperSpecialChars = () ->
        if not isSpecial(char) and newStr is 1
          if isQuote(char)
            importHandled += "'"
          else
            importHandled += "'" + char
          newStr = 2
        # \n always means new proprty or EOF
        else if char is "'" and newStr is 2 and nextChar is '.'
          importHandled += ".\'"
          skip = true
          newStr = 0
        else if isQuote(char) and isSpecial(nextChar) and newStr is 2
          importHandled += "'"
          newStr = 0
        # handles ' because it is being used to quote the string -> needs to be escaped
        else if char is "'" and newStr is 2 and not isSpecial(nextChar)
          importHandled += "\\'"
        # handles \ so that backslash is escaped
        else if char is '\\' and newStr is 2
          importHandled += '\\\\'
        else
          importHandled += char

      # removes leading spaces
      for char, i in imported
        if char is "'"
          imported = imported.slice i
          break

      for char, i in imported
        nextChar = imported[i+1]
        prevChar = imported[i-1]

        if skip
          skip = false
        else if char is '\r'
          # do nothing
          continue
        else if char is '\n'
          newLineHandler()
        else if (char is ':' or char is '：') and newStr isnt 2
          colonHandler()
        else if newStr is 0
          if char is ' '
            leadingSpaceHandler()
          else
            # handles using ‘’ to quote a property
            if char is '‘' or char is '’'
              importHandled += "'"
            else
              importHandled += char
        else
          handleSuperSpecialChars()

      imported = CSON.parseCSONString importHandled

      # FOR DEV ONLY
      if DEV is true
        if imported.code?
          grunt.file.write "output/#{language}_output.coffee", imported.code
        else
          grunt.file.write "output/#{language}_output.coffee", CSON.stringify imported
        console.log imported

      # NOTE: if code is a property of a valid obj this will still fire
      if imported.code?
        grunt.fail.fatal "there is a problem with the importers handling\n#{imported}"

      # compare this file to master file to check for accidental new keys
      error = false
      traverse  = (obj, mast) ->
        for key,property of obj
          if typeof property is 'object'
            if mast[key]?
              traverse property, mast[key]
            else
              grunt.log.warn "#{key} doesn't seem to exist, from #{language}." unless quiet
              error = true
          else
            if not mast[key]?
              grunt.log.warn "#{key} doesn't seem to exist, from #{language}" unless quiet
              error = true

      traverse imported[language], mastObj

      if not error or config.createOnWarn
        extend true, langObj, imported[language]

        sourceCode = 'module.exports =\n' + CSON.stringify langObj
        grunt.file.write dest, sourceCode
