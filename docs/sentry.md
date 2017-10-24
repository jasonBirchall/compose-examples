# Sentry

* [Compose file](../sentry/docker-compose.yml)

## Setting application-specific environment variables

```
eb init \
  --profile <aws-profile> \
  <beanstalk-application-name>

# Generate sentry key
docker run --rm sentry config generate-secret-key

# Get current AWS resource environment variables
eb printenv

eb setenv -e <environment-name> \
  SENTRY_SECRET_KEY=<secretkey> \
  SENTRY_DB_HOST=<dbhost> \
  SENTRY_DB_USER=<dbuser> \
  SENTRY_DB_NAME=<dbname> \
  SENTRY_DB_PASSWORD=<dbpassword> \
  SENTRY_REDIS_HOST=<redishost>
```

## Application Specific Steps

```
# Application configuration steps from https://hub.docker.com/_/sentry/

# Make sure pem key is in key ring and ssh through the bastion onto the instance
ssh-add default.pem
ssh -A -t -i default.pem ec2-user@bastion ssh ec2-user@ecs-instance

# Run upgrade command inside a sentry container
docker ps
# Run the sentry upgrade step
docker exec -it <running_container> sentry upgrade --noinput
# Create initial user
docker exec -it <running_container> sentry createuser
```
