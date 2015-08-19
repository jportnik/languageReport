module.exports = (grunt) ->
  grunt.initConfig
    langRep:
      lang:
        files: [
          expand: true
          cwd: 'client/assets/strings'
          dest: 'tmpDir/'
          src: '**/str.coffee'
        ]
        langs: ['en', 'fr', 'es', 'it', 'pt', 'ru', 'te', 'zh']
        master: 'en'

    verify:
      verf:
        master: 'client/assets/strings/en/str.coffee'
        include: [
          'client/**/*.coffee'
          'client/**/*.html'
        ]
        exclude: [
          'client/assets/**'
          'client/config/**'
          'client/vendor/** '
        ]

    import:
      imp:
        createOnWarn: true
        master: 'en'
        trans: '../Translations/*.coffee'
        files: [
          expand: true
          cwd: '../client/assets/strings'
          src: '**/str.coffee'
          # change to same as cwd if you want to overwrite existing files
          dest: '../tmpDir/'
        ]

  #Load tasks folder
  grunt.loadTasks 'tasks'
