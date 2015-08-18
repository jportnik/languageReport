# lang-rep

> Language report plugin

## Getting Started
This plugin requires Grunt `~0.4.5`

If you haven't used [Grunt](http://gruntjs.com/) before, be sure to check out the [Getting Started](http://gruntjs.com/getting-started) guide, as it explains how to create a [Gruntfile](http://gruntjs.com/sample-gruntfile) as well as install and use Grunt plugins. Once you're familiar with that process, you may install this plugin with this command:

```shell
npm install lang-rep
```

Once the plugin has been installed, it may be enabled inside your Gruntfile with this line of JavaScript:

```js
grunt.loadNpmTasks('lang-rep');
```

## The "langRep" task
```shell
grunt langRep -<options>
```
where options is zip or sep  
zip: zips a the separate files  
sep: separates the output by language (each file is a different language)

```coffeescript
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
```

## The "verify" task
```shell
grunt verify
```
used for checking a directory for keys of an object, to see if they are in use
```coffeescript
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
```

## The "import" task
```shell
grunt import
```
imports new translations and combines with an existing string file and outputing to given destination
```coffeescript
import:
  imp:
    trans: 'Translations/*.coffee'
    files: [
      expand: true
      cwd: 'client/assets/strings'
      src: '**/str.coffee'
      dest: 'tmpDir/'
    ]
```
