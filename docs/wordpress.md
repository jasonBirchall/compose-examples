# Wordpress

* [Compose file](../wordpress/docker-compose.yml)

## Setting environment variables

```
eb init \
  --profile <aws-profile> \
  <beanstalk-application-name>
```

```
eb printenv
eb setenv -e <environment-name> \
  WORDPRESS_DB_HOST=<dbhost> \
  WORDPRESS_DB_USER=<dbuser> \
  WORDPRESS_DB_NAME=<dbname>
