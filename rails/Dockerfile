FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp

## Rails setup
ENV RAILS_ENV production
# Precompile assets in here to setup digest
RUN RAILS_ENV=production bundle exec rake assets:clean assets:precompile
ENV UNICORN_PORT 3000
EXPOSE $UNICORN_PORT

COPY run.sh /run.sh
RUN chmod +x /run.sh
CMD /run.sh
