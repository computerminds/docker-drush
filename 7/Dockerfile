FROM drush/drush:7

MAINTAINER "Steven Jones" <steven.jones@computerminds.co.uk>

# Trust github for git clones.
RUN mkdir -p ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
# Trust alfresco for git clones.
RUN mkdir -p ~/.ssh && ssh-keyscan -t rsa gitlab.alfresco.com >> ~/.ssh/known_hosts
# Trust new! alfresco for git clones.
RUN mkdir -p ~/.ssh && ssh-keyscan -t rsa git.alfresco.com >> ~/.ssh/known_hosts

# Add Dockerize, as it's useful.
RUN \
  apt-get update && apt-get install -y wget && \
  wget https://github.com/jwilder/dockerize/releases/download/v0.1.0/dockerize-linux-amd64-v0.1.0.tar.gz && \
  tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.1.0.tar.gz && \
  apt-get remove -y wget && \
  apt-get autoremove -y && \
  apt-get clean all

# Hack Drush, make Drush make exit early on errors.
ADD commands/make/make.download.inc /composer/vendor/drush/drush/commands/make/make.download.inc
ADD commands/make/make.utilities.inc /composer/vendor/drush/drush/commands/make/make.utilities.inc

# Hack Drush, fix the runserver to handle image styles.
ADD commands/runserver/runserver-prepend.php /composer/vendor/drush/drush/commands/runserver/runserver-prepend.php
ADD commands/runserver/runserver.drush.inc /composer/vendor/drush/drush/commands/runserver/runserver.drush.inc


ADD bootstrap.make /tmp/bootstrap.make
# Warm the Drush caches, but then remove the release info cache.
RUN drush make --test /tmp/bootstrap.make && rm -rf /root/.drush/cache/download/*updates.drupal.org*

# Get emails sent into a log file.
RUN echo "sendmail_path = 'cat > /var/log/php-mail.log'" >> /usr/local/etc/php/conf.d/computerminds-email.ini
# But stop PHP errors because of extra parameters to sendmail.
RUN echo "mail.force_extra_parameters = ''" >> /usr/local/etc/php/conf.d/computerminds-email.ini
