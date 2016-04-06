FROM drush/drush:6

RUN mkdir ~/.ssh && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts

ADD bootstrap.make /tmp/bootstrap.make

# Warm the Drush caches, but then remove the release info cache.
RUN drush make --test /tmp/bootstrap.make && rm -rf /root/.drush/cache/download/*updates.drupal.org*
