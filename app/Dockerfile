FROM phusion/passenger-ruby22:0.9.18

RUN usermod -u 1000 app
RUN groupmod -g 1000 app

RUN chown -R app: /home/app

ENV HOME /root

CMD ["/sbin/my_init"]

RUN rm -f /etc/service/nginx/down

RUN rm /etc/nginx/sites-enabled/default
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

RUN apt-get update \
	&& apt-get install -y --no-install-recommends uuid-dev \
    && apt-get -y install -f --no-install-recommends


RUN mkdir /home/app/redmine
RUN mkdir /home/app/redmine/config
COPY ./Gemfile /home/app/redmine
COPY ./database.yml /home/app/redmine/config/database.yml
RUN bundle config --global silence_root_warning 1
RUN cd /home/app/redmine && bundle install

COPY ./redmine-sources /home/app/redmine
RUN cd /home/app/redmine && bundle install

RUN rm -rf /home/app/redmine/tmp
RUN rm -rf /home/app/redmine/log
RUN mkdir /home/app/redmine/tmp && chown -R app: /home/app/redmine/tmp && chmod -R 775 /home/app/redmine/tmp
RUN mkdir /home/app/redmine/log && chown -R app: /home/app/redmine/log && chmod -R 775 /home/app/redmine/log

RUN mkdir /home/app/redmine/files && chown -R app: /home/app/redmine/files && chmod -R 775 /home/app/redmine/files

RUN chown -R app: /home/app/redmine/public/plugin_assets && chmod -R 775 /home/app/redmine/public/plugin_assets

VOLUME /home/app/redmine/files

COPY ./configuration.yml /home/app/redmine/config/configuration.yml

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*