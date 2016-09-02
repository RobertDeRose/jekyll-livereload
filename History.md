## 0.2.2 / 2016-09-01

## Do not include Livereload script during Jekyll build command

  * The Livereload script was being included during the Jekyll build
    command. This has been corrected to only include it is Jekyll is
    also running it's built-in web server.

## 0.2.1 / 2016-05-25

## Fix bad build

  * Changes to gemspec accidentally removed the required js files

## 0.2.0 / 2016-05-22

### Add HTTPS support

  * If you start Jekyll with `--ssl-key` and `--ssl-cert`
    the Livereload Websocket server will start with HTTPS support

## 0.1.1 / 2016-05-09

### Minor fixes and improvements

  * Don't start Websocket unless --livereload is included
  * Support configuration through `_config.yml` file

## 0.1.0 / 2016-05-09

### Initial Release

  * First release of Jekyll-Livereload
