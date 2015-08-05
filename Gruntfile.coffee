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
        exclude: ['strings', '.git', 'node_modules']
        dirToSearch: 'client/'

  #Load tasks folder
  grunt.loadTasks 'tasks'
