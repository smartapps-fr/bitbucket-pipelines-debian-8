[![Travis Build Status](https://travis-ci.org/smartapps-fr/bitbucket-pipelines-php-mysql.svg?branch=master)](https://travis-ci.org/smartapps-fr/bitbucket-pipelines-php-mysql)
[![Microbadger badge](https://images.microbadger.com/badges/image/smartapps/bitbucket-pipelines-php-mysql.svg)](https://microbadger.com/images/smartapps/bitbucket-pipelines-php-mysql)

# bitbucket-pipelines-php-mysql

[Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) [Docker](https://www.docker.com/) image based on [Debian _Jessie_](https://www.debian.org/releases/jessie/) with [PHP](http://php.net/)/[MySQL](https://www.mysql.com) (and more !)

More help in Bitbucket's [Confluence](https://confluence.atlassian.com/bitbucket/bitbucket-pipelines-beta-792496469.html)

Docker image at [smartapps/bitbucket-pipelines-php-mysql](https://hub.docker.com/r/smartapps/bitbucket-pipelines-php-mysql/) (no `CMD` as it is overriden by *Pipelines*)

## Packages installed

 - `php5-apcu`, `php5-cli`, `php5-curl`, `php5-gd`, `php5-geoip`, `php-gettext`, `php5-imagick`, `php5-intl`, `php5-json`, `php5-mcrypt`, `php5-memcached`, `php5-mysqlnd`, `php5-sqlite`, `php5-xdebug`, `php5-xhprof`, `php5-xmlrpc`, `memcached`, `imagemagick`, `openssh-client`, `curl`, `gettext`, `zip`, `git`, `subversion`
 - [Perl](https://www.perl.org/) 5.20
 - [Python](https://www.python.org/) 2.7 & 3.4
 - [MySQL](https://www.mysql.com/) 5.5 (user `root:root`)
 - [PHP](http://www.php.net/) 5.6
 - [Ruby](https://www.ruby-lang.org/) 2.1
 - [Node.js](https://nodejs.org/) 4.x LTS
 - Latest [Composer](https://getcomposer.org/), [Gulp](http://gulpjs.com/), [Webpack](https://webpack.github.io/), [Mocha](https://mochajs.org/), [Grunt](http://gruntjs.com/), [PHPUnit](https://phpunit.de/), [Codeception](https://codeception.com/), [Yarn](https://yarnpkg.com/)

## Sample `bitbucket-pipelines.yml`

```YAML
image: smartapps/bitbucket-pipelines-php-mysql
pipelines:
  default:
    - step:
        script:
          - service mysql start
          - mysql -h localhost --user=root --password=root -e "CREATE DATABASE test;"
          - composer config -g github-oauth.github.com XXXXXXXX
          - composer install --no-interaction --no-progress --prefer-dist
          - npm install --no-spin
          - gulp
```

## Debian _Stretch_

A Docker image based on [Debian _Stretch_](https://www.debian.org/releases/stretch/), PHP 7, MySQL 5.6, Node.js 6.x and Ruby 2.3 is available under `stretch` branch (and with Docker tag `stretch`).

## Changelog

### 0.2

 - Adds Ruby, Grunt, Webpack, Mocha, Sqlite, PHPUnit, Memcached, Codeception
 - Adds `php5-xdebug`, `php5-intl`, `php5-memcached`
 - Set `root` password to `root`

### 0.1

 - Initial release
 - Perl, Python, PHP, MySQL, Node.js
 - Composer, Gulp
