module.exports = (grunt) ->
  grunt.initConfig
    langRep:
      lang:
        files: [
          expand: true
          cwd: './strings'
          dest: 'tmpDir/'
          src: '**/str.coffee'
        ]
        langs: ['en', 'fr', 'es', 'it', 'pt', 'ru', 'te', 'zh']
        master: 'en'

    verify:
      verf:
        master: './strings/en/str.coffee'
        include: [
          'strings/**/*.coffee'
          'strings/**/*.html'
        ]
        exclude: [
          'strings/assets/**'
          'strings/config/**'
          'strings/vendor/**'
        ]

    import:
      imp:
        master: 'en'
        trans: '../Translations/*.coffee'
        files: [
          expand: true
          cwd: './strings'
          src: '**/str.coffee'
          # change to same as cwd if you want to overwrite existing files
          dest: './tmpDir/'
        ]

  #Load tasks folder
  grunt.loadTasks 'tasks'
