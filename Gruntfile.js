/*
 * lang-rep
 * https://github.com/root/jackmaloney
 *
 * Copyright (c) 2015 Jack Maloney
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {

  grunt.initConfig({
    langRep: {
      cwd: './',
      dest: 'output/',
      src: '../testStrings',
      langs: ['en', 'fr', 'es', 'it', 'pt', 'ru', 'te', 'zh'],
      master: 'en'
    },
    verify: {
      src: '../testStrings/en/str.coffee',
      dest: 'output/',
      path: 'tasks'
    }
  });

  //Load tasks folder
  grunt.loadTasks('tasks');
};
