/*
 * langRep-plugin
 * https://github.com/root/jackmaloney
 *
 * Copyright (c) 2015 Jack Maloney
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  // Actually load this plugin's task(s).
  grunt.loadTasks('tasks');

  grunt.registerTask('default', function() {
    console.log("Hey you should pick a task next time (-h for help)")
  });

};
