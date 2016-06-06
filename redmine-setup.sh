#!/bin/bash

docker exec -it -u root redmine_app bash -c 'cd /home/app/redmine && RAILS_ENV=production bundle exec rake db:migrate'
docker exec -it -u root redmine_app bash -c 'cd /home/app/redmine && RAILS_ENV=production bundle exec rake generate_secret_token'