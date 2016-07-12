# bitbucket-pipelines-php-mysql

[Bitbucket Pipelines](https://bitbucket.org/product/features/pipelines) [PHP](http://php.net/)/[MySQL](https://www.mysql.com)
Docker image based on [Debian/Jessie](https://www.debian.org/releases/jessie/) (no `CMD` as it is overriden by *Bitbucket Pipelines*)

More help in Bitbucket's [Confluence](https://confluence.atlassian.com/bitbucket/bitbucket-pipelines-beta-792496469.html)

Docker image at [smartapps/bitbucket-pipelines-php-mysql](https://hub.docker.com/r/smartapps/bitbucket-pipelines-php-mysql/)

Sample `bitbucket-pipelines.yml`:

```YAML
image: smartapps/bitbucket-pipelines-php-mysql
pipelines:
  default:
    - step:
        script:
          - service mysql start
          - mysql -h localhost -u root -e "CREATE DATABASE test;"
          - composer config -g github-oauth.github.com XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX
          - composer install --no-interaction --no-progress --prefer-dist
          - npm install --no-spin
          - gulp
```
