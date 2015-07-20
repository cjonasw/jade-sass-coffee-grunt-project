module.exports = (grunt) ->

  grunt.initConfig
    sass:

      development: # Can be called whatever you want
        files: [ {
          expand: true
          cwd: 'src'
          src: '**/*.sass'
          dest: 'target/'
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
          dest: 'target/'
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
          src: ['**/*.coffee', '!node_modules/**/*.coffee', '!Gruntfile.coffee']
          dest: 'target/'
          ext: '.js'
        } ]

        # options:
        #   sourceMap: true

    watch:

      sass:
        files: [ '**/*.sass' ]
        tasks: [
          'sass'
        ]

      jade:
        files: [ '**/*.jade' ]
        tasks: [
          'jade'
        ]

      coffee:
        files: [ '**/*.coffee' ]
        tasks: [
          'coffee'
        ]
  grunt.registerTask 'compile', [
    'sass',
    'jade',
    'coffee'
  ]

  grunt.registerTask 'local', [
    'compile',
    'watch'
  ]

  grunt.loadNpmTasks 'grunt-sass' # not using a grunt contrib as it requires installing ruby
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
