FROM phusion/passenger-ruby22:0.9.18

RUN usermod -u 1000 app
RUN groupmod -g 1000 app

RUN chown -R app: /home/app

ENV HOME /root

CMD ["/sbin/my_init"]

# Configure Nginx 
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

# Dependencies
RUN apt-get update \
	&& apt-get install -y --no-install-recommends uuid-dev \
    && apt-get -y install -f --no-install-recommends

# Redmine application
COPY ./redmine-sources /home/app/redmine

# Redmine configs
COPY ./database.yml /home/app/redmine/config/
COPY ./configuration.yml /home/app/redmine/config/

# Dependencies installation
RUN cd /home/app/redmine && bundle config --global silence_root_warning 1
RUN cd /home/app/redmine && bundle install --without development test 

# File system permissions
RUN cd /home/app/redmine && mkdir -p tmp tmp/pdf public/plugin_assets
RUN cd /home/app/redmine && sudo chown -R app:app files log tmp public/plugin_assets
RUN cd /home/app/redmine && sudo chmod -R 755 files log tmp public/plugin_assets

# Clear apt-get
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*