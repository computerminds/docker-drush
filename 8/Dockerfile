FROM drush/drush:8

MAINTAINER "Steven Jones" <steven.jones@computerminds.co.uk>

# Trust github for git clones.
RUN mkdir -p ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
# Trust alfresco for git clones.
RUN mkdir -p ~/.ssh && ssh-keyscan -t rsa gitlab.alfresco.com >> ~/.ssh/known_hosts
# Trust new! alfresco for git clones.
RUN mkdir -p ~/.ssh && ssh-keyscan -t rsa git.alfresco.com >> ~/.ssh/known_hosts

# Add Dockerize, as it's useful.
RUN \
  apt-get update && apt-get install -y wget curl && \
  wget https://github.com/jwilder/dockerize/releases/download/v0.1.0/dockerize-linux-amd64-v0.1.0.tar.gz && \
  tar -C /usr/local/bin -xzvf dockerize-linux-amd64-v0.1.0.tar.gz && \
  apt-get remove -y wget && \
  apt-get autoremove -y && \
  apt-get clean all

RUN drush --version

# Get emails sent into a log file.
RUN echo "sendmail_path = 'cat > /var/log/php-mail.log'" >> /usr/local/etc/php/conf.d/computerminds-email.ini
# But stop PHP errors because of extra parameters to sendmail.
RUN echo "mail.force_extra_parameters = ''" >> /usr/local/etc/php/conf.d/computerminds-email.ini

# Add make composer faster plugin.
RUN composer global require hirak/prestissimo

ADD composer.json /tmp/composer.json
# Warm the composer caches with our common config.
RUN \
  cd /tmp && \
  composer install --no-dev
