module.exports = (grunt) ->
  grunt.registerMultiTask 'import', 'imports new translations and combines with an existing string file then outputs to given destination', ->
    CSON = require 'cson'
    extend = require 'extend'
    transFilesToImport = grunt.file.expand @data.trans
    linefeed = grunt.util.linefeed

    # -q to suppress errors
    quiet = grunt.option 'q'

    masterLanguage = @data.master
    files = @files

    # protects against infinite while loop below
    # when looking for the master language file
    if files.length is 0
      grunt.fail.fatal "No files found. Check the files path array for mistakes."

    # get master language
    masterLanguageObject = {}
    found = false
    while not found
      for file in files
        for path in file.src
          if path.indexOf("/#{masterLanguage}/") > -1
            masterLanguageObject = CSON.requireCSFile path
            found = true

    transFilesToImport.forEach (trans) ->
      imported = grunt.file.read trans
      min = (imported.split '\'')[0].length
      language = (imported.split '\'')[1]

      found = false
      langObj = {}
      dest = null

      # checks is language exists, if not throws error and exits
      exists = false
      while not exists
        for file in files
          for path in file.src
            if (path.indexOf "/#{language}/") > -1
              langObj = CSON.requireCSFile path
              exists = true
              dest = file.dest

      grunt.fail.fatal "The language: #{language} file doesn't exist." if not exists

      stringParsingState = PARSING_KEY
      importHandled = ''
      currentSpaces = 0
      previousSpaces = 0
      smallerEqual = false
      lastChar = ''
      skipNextChar = false

      # Used for determining if a char is special
      # RETURNS: Bool
      isSpecial = (char) ->
        return char in ['\n', '\r', ' ', ':', '：']

      # Used for determining if a char is a quote
      # RETURNS: Bool
      isQuote = (char) ->
        return char in ['\'', '\"', '‘', '’']

      # creates spaces that go in front of the key
      # RETURNS: string of spaces
      createSpaces = (num) ->
        return grunt.util.repeat(num, ' ')

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
            importHandled += "''" + linefeed + spaceStr
          else
            importHandled += linefeed + spaceStr

          smallerEqual = false
          previousSpaces = currentSpaces
          currentSpaces = 0

      # handles issues with missing quotes at the end of lines
      # NOTE: doesn't add new lines, that is done in leadingSpaceHandler
      newLineHandler = () ->
        # if we have '\r' it is before '\n' so go back one more char
        if prevChar is '\r' then lastChar = imported[i-2] else lastChar = prevChar

        if stringParsingState is PARSING_INLINE_OR_STRING
          if prevChar is "'" and isSpecial(imported[i-2])
            importHandled += "'"
          else if prevChar isnt "'"
            importHandled += "'"
          else
        stringParsingState = PARSING_KEY

      # handles issues with the colon and if the next chars are a new obj
      # or a value to a proprety
      colonHandler = () ->
        importHandled += ':'
        stringParsingState = 1
        if nextChar is '\r' or nextChar is '\n'
          smallerEqual = false
        else
          smallerEqual = true

      handleParsingInlineOrStringOddities = () ->
        # handles periods outside of quotes
        if char is "'" and nextChar is '.'
          importHandled += ".\'"
          skipNextChar = true
          stringParsingState = PARSING_KEY
        # changes last quote to '
        else if isQuote(char) and isSpecial(nextChar)
          importHandled += "'"
          stringParsingState = PARSING_KEY
        # handles ' in property that need to be escaped
        else if char is "'" and not isSpecial(nextChar)
          importHandled += "\\'"
        # handles \ in property that need to be escaped
        else if char is '\\' and not isSpecial(nextChar)
          importHandled += "\\'"
        else
          importHandled += char

      handleParsingAfterColonOddities = () ->
        if not isSpecial(char)
          if isQuote(char)
            importHandled += "'"
          else
            importHandled += "'" + char
          stringParsingState = PARSING_INLINE_OR_STRING
        else
          importHandled += char

      # removes leading spaces
      imported.trim()

      PARSING_KEY = 0
      PARSING_AFTER_COLON = 1
      PARSING_INLINE_OR_STRING = 2
      for char, i in imported
        nextChar = imported[i+1]
        prevChar = imported[i-1]

        if skipNextChar
          skipNextChar = false
        else if char is '\r'
          # do nothing
          continue
        else if char is '\n'
          newLineHandler()
        else if (char is ':' or char is '：') and stringParsingState isnt PARSING_INLINE_OR_STRING
          colonHandler()
        else if stringParsingState is PARSING_KEY
          if char is ' '
            leadingSpaceHandler()
          else
            # handles using ‘’ to quote a property
            if char is '‘' or char is '’'
              importHandled += "'"
            else
              importHandled += char
        else
          if stringParsingState is PARSING_INLINE_OR_STRING
            handleParsingInlineOrStringOddities()
          else
            handleParsingAfterColonOddities()

      imported = CSON.parseCSONString importHandled

      # NOTE: if code is a property of a valid obj this will still fire
      if imported.code?
        grunt.fail.fatal "there is a problem with the importers handling\n#{imported}"

      grunt.verbose.writeln CSON.stringify imported

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

      traverse imported[language], masterLanguageObject

      # protects the below from accidental new keys, can be forced past
      if error
        grunt.fail.warn 'File not updated due to non-existant keys.'
      else
        grunt.log.ok 'Import successful. File updated.'

      extend true, langObj, imported[language]

      sourceCode = "module.exports =#{linefeed}" + CSON.stringify langObj
      grunt.file.write dest, sourceCode
