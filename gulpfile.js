var gulp = require('gulp');
var coffee = require('gulp-coffee');
var concat = require('gulp-concat');
var uglify = require('gulp-uglify');
var imagemin = require('gulp-imagemin');
var sourcemaps = require('gulp-sourcemaps');
var del = require('del');
var jade = require('gulp-jade');

var paths = {
  scripts: ['src/js/**/*.coffee'],
  images: ['src/**/*.png', 'src/**/*.ico'],
  templates: 'src/**/*.jade'
};

gulp.task('clean', function(cb) {
  del(['dst'], cb);
});

gulp.task('scripts', [], function() {
  return gulp.src(paths.scripts)
    .pipe(sourcemaps.init())
      .pipe(coffee())
      //.pipe(uglify())
      .pipe(concat('all.min.js'))
    .pipe(sourcemaps.write())
    .pipe(gulp.dest('dst/js'));
});


// Copy all static images
gulp.task('images', [], function() {
  return gulp.src(paths.images)
    // Pass in options to the task
    .pipe(imagemin({optimizationLevel: 5}))
    .pipe(gulp.dest('dst'));
});

// Copy all templates
gulp.task('templates', [], function() {
  return gulp.src(paths.templates)
    .pipe(jade({
      pretty: true
    }))
    .pipe(gulp.dest('dst'));
});

// execute server
gulp.task('express', function() {
  var express = require('express');
  var app = express();
  app.use(require('connect-livereload')({port: 4002}));
  app.use(express.static(__dirname + '/dst'));
  app.listen(4000);
});

// Live reload
var tinylr;
gulp.task('livereload', function() {
  tinylr = require('tiny-lr')();
  tinylr.listen(4002);
});
function notifyLiveReload(event) {
  var fileName = require('path').relative(__dirname, event.path);
  setTimeout(function(){
    tinylr.changed({
      body: {
        files: [fileName]
      }
    });
  }, 100)
  
}

// Rerun the task when a file changes
gulp.task('watch', function() {
  gulp.watch(paths.scripts, function( event ){ gulp.run('scripts'); notifyLiveReload(event); });
  gulp.watch(paths.images, function( event ){ gulp.run('images'); notifyLiveReload(event); });
  gulp.watch(paths.templates, function( event ){ gulp.run('templates'); notifyLiveReload(event); });
});

// The default task (called when you run `gulp` from cli)
gulp.task('default', ['scripts', 'images', 'templates']);

gulp.task('dev', ['express', 'livereload', 'default', 'watch']);

