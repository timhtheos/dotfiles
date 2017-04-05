if exists("did_load_filetypes")
  finish
endif

augroup filetypedetect
  " Drupal files.
  au! BufRead,BufNewFile *.install setf php.drupal
  au! BufRead,BufNewFile *.test setf php.drupal
  au! BufRead,BufNewFile *.inc setf php.drupal
  au! BufRead,BufNewFile *.module setf php.drupal
  au! BufRead,BufNewFile *.profile setf php.drupal
  au! BufRead,BufNewFile *.theme setf php.drupal
  au! BufRead,BufNewFile *.info setf dosini

  " EJS and Swig files.
  au! BufRead,BufNewFile *.ejs setf html
  au! BufRead,BufNewFile *.swig setf html

  au! BufRead,BufNewFile *.twig setf jinja
augroup END
