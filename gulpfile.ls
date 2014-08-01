require! <[ gulp gulp-util gulp-jade gulp-livescript ]>
gutil = gulp-util

gulp.task 'html' ->
  gulp.src 'src/*.jade'
    .pipe gulp-jade!
    .pipe gulp.dest 'public'

gulp.task 'js' ->
  gulp.src 'src/*.ls'
    .pipe gulp-livescript!
    .pipe gulp.dest 'public'

gulp.task 'jquery' ->
  require! <[ gulp-uglify gulp-rename ]>
  gulp.src 'src/*.js'
    .pipe gulp-uglify!
    .pipe gulp-rename 'jquery.cystyle.min.js'
    .pipe gulp.dest 'build'

gulp.task 'build' <[ html js ]>

gulp.task 'dev' <[build]> ->
  require! 'gulp-nodemon'
  gulp-nodemon script: 'app.ls', ext: 'ls jade', execMap: 'ls': 'lsc'
    .on 'change', <[ build ]>
    .on 'restart', -> gutil.log 'Restarting'

gulp.task 'default' <[ build ]>