/*
 * langRep-plugin
 * https://github.com/root/jackmaloney
 *
 * Copyright (c) 2015 Jack Maloney
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  grunt.initConfig({
  //Before generating any new files, remove any previously-created files.
    clean: {
      clean: ["output"]
    }
  });

  // Actually load this plugin's task(s).
  grunt.loadTasks('tasks');

  grunt.loadNpmTasks("grunt-contrib-clean");

  grunt.registerTask('default', function() {
    console.log("Hey you should pick a task next time (-h for help)");
  });
};
