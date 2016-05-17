FROM drush/drush:6

RUN mkdir ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

ADD bootstrap.make /tmp/bootstrap.make

# Warm the Drush caches, but then remove the release info cache.
RUN drush make --test /tmp/bootstrap.make && rm -rf /root/.drush/cache/download/*updates.drupal.org*

# Get emails sent into a log file.
RUN echo "sendmail_path = 'cat > /var/log/php-mail.log'" >> /usr/local/etc/php/conf.d/computerminds-email.ini
# But stop PHP errors because of extra parameters to sendmail.
RUN echo "mail.force_extra_parameters = ''" >> /usr/local/etc/php/conf.d/computerminds-email.ini
