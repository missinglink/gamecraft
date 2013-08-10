module.exports = (grunt) =>
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-handlebars'
  grunt.loadNpmTasks 'grunt-browserify2'
  grunt.loadNpmTasks 'grunt-exec'
  grunt.loadNpmTasks 'grunt-parallel'

  grunt.initConfig

    less:
      development:
        options: compress: true, optimization: 2, yuicompress: true
        files:
          "./css/index.css": "./less/index.less"

    coffee:
      development:
        options: bare: true
        files: [
          expand: true
          cwd: 'src/',
          src: [ "**/*.coffee" ]
          dest: "./lib/"
          ext: '.js'
        ]

    browserify2:
      compile:
        entry: './lib/app.js'
        compile: './js/app.js'

    watch:

      less:
        files: [ './less/*/**.less', './less/*.less' ]
        tasks: 'less'
        options: interrupt: true

      coffee:
        files: './src/**/*.coffee'
        tasks: 'coffee'
        options: interrupt: true

      bundle:
        files: [ './src/**/*.coffee' ]
        tasks: [ 'coffee', 'browserify2' ]
        options: interrupt: true

    parallel:
      watch:
        tasks: [
          {
            grunt: true,
            args: [ 'watch:less' ]
          }
          {
            grunt: true,
            args: [ 'watch:coffee' ]
          }
          {
            grunt: true,
            args: [ 'watch:bundle' ]
          }
        ]

  grunt.registerTask 'default', 'parallel:watch'
  grunt.registerTask 'build', [ 'less', 'coffee', 'browserify2' ]
