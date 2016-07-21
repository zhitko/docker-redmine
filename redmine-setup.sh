#!/bin/bash

source .env

docker exec -it -u root "${PREFIX}_app" bash -c 'cd /home/app/redmine && RAILS_ENV=production bundle exec rake db:migrate'
docker exec -it -u root "${PREFIX}_app" bash -c 'cd /home/app/redmine && RAILS_ENV=production bundle exec rake generate_secret_token'
docker exec -u root "${PREFIX}_app" bash -c 'cd /home/app/redmine && RAILS_ENV=production bundle install'                                                                                                         
docker exec -u root "${PREFIX}_app" bash -c 'cd /home/app/redmine && RAILS_ENV=production bundle exec rake redmine:plugins:migrate'