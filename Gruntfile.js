/*
 * lang-rep
 * https://github.com/root/jackmaloney
 *
 * Copyright (c) 2015 Jack Maloney
 * Licensed under the MIT license.
 */

'use strict';

module.exports = function(grunt) {
  //configuration options
  grunt.initConfig({
    langRep: {
        sep: true,
        zip: false,
        dead: true
    }
  });

  //Load tasks folder
  grunt.loadTasks('tasks');
};
