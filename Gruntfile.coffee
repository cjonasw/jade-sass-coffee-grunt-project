module.exports = (grunt) ->

  everythingElse = [
    '**/*.*', 
    '!**/*.sass', 
    '!**/*.jade', 
    '!**/*.coffee' 
  ]

  grunt.initConfig

    connect: {
      server: {
        options: {
          port: 9001,
          base: ['', 'target'],
          livereload: true
        }
      }
    }

    sass:

      development: # Can be called whatever you want
        files: [ {
          expand: true
          cwd: 'src'
          src: '**/*.sass'
          dest: 'target'
          ext: '.css'
        } ]

        # options:
        #   sourceMap: true

    jade:
      development: # Can be called whatever you want
        files: [ {
          expand: true
          cwd: 'src'
          src: '**/*.jade'
          dest: 'target'
          ext: '.html'
        } ]

        # options:
        #   data:
        #     debug: false

    coffee:

      development: # Can be called whatever you want
        files: [ {
          expand: true
          cwd: 'src'
          src: [
            '**/*.coffee',
            '!node_modules/**/*.coffee',
            '!Gruntfile.coffee'
          ]
          dest: 'target'
          ext: '.js'
        } ]

        # options:
        #   sourceMap: true

    copy:

      everythingElse:

        files: [ {
          expand: true
          cwd: 'src'
          src: everythingElse
          dest: 'target'
        } ]



    watch:

      sass:
        files: [ 
          '**/*.sass'
        ]
        tasks: [
          'newer:sass'
        ]
        options:
          cwd: 'src',
          livereload: true

      jade:
        files: [
          '**/*.jade'
        ]
        tasks: [
          'newer:jade'
        ]
        options:
          cwd: 'src',
          livereload: true

      coffee:
        files: [
          '**/*.coffee'
        ]
        tasks: [
          'newer:coffee'
        ]
        options:
          cwd: 'src',
          livereload: true

      everythingElse:
        files: everythingElse
        tasks: [
          'newer:copy:everythingElse'
        ]
        options:
          cwd: 'src',
          livereload: true

  grunt.registerTask 'compile', [
    'sass',
    'jade',
    'coffee'
  ]

  grunt.registerTask 'serve', [
    'compile',
    'copy:everythingElse',
    'connect:server',
    'watch'
  ]

  grunt.registerTask 'build', [
    'compile'
  ]

  grunt.loadNpmTasks 'grunt-sass' # not using a grunt contrib as it requires installing ruby
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-newer'
  grunt.loadNpmTasks 'grunt-contrib-connect'
