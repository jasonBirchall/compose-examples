#!/bin/bash
bundle exec rake db:setup
bundle exec rake db:migrate
bundle exec rails s -p 3000 -b 0.0.0.0
