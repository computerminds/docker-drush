FROM drush/drush:7

MAINTAINER "Steven Jones" <steven.jones@computerminds.co.uk>

# Trust github for git clones.
RUN mkdir ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

# Add Dockerize, as it's useful.
RUN \
  apt-get update && apt-get install -y wget && \
  wget https://github.com/jwilder/dockerize/releases/download/v0.1.0/dockerize-linux-amd64-v0.1.0.tar.gz && \
  tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.1.0.tar.gz && \
  apt-get remove -y wget && \
  apt-get autoremove -y && \
  apt-get clean all

# Hack Drush, make Drush make exit early on errors.
ADD commands/make/make.utilities.inc /root/composer/vendor/drush/drush/commands/make/make.utilities.inc

# Hack Drush, fix the runserver to handle image styles.
ADD commands/runserver/runserver-prepend.php /root/composer/vendor/drush/drush/commands/runserver/runserver-prepend.php
ADD commands/runserver/runserver.drush.inc /root/composer/vendor/drush/drush/commands/runserver/runserver.drush.inc

# Warm the Drush caches, but then remove the release info cache.
ADD bootstrap.make /tmp/bootstrap.make
RUN drush make --test /tmp/bootstrap.make && rm -rf /root/.drush/cache/download/*updates.drupal.org*
