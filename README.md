A docker image with lots of switches running Caddy web server and PHP-FPM.

## Included Software

This image tries to balance convenience and bloat. The image includes most of the software and PHP extensions you'll need for a typical PHP web stack. Be sure to check the dockerfile for the latest list of installed software and PHP extensions.

## Environment Configuration

For easy customization, you may override any of the environment variables used in the Dockerfile. The configuration is modified at container boot so there is no need to re-build the container with each ENV modification.

```
ENV DOCUMENT_ROOT=/web/public \
    XDEBUG_ENABLED=0 \
    XDEBUG_REMOTE_ENABLE=0 \
    XDEBUG_REMOTE_AUTOSTART=0 \
    XDEBUG_REMOTE_CONNECT_BACK=0 \
    XDEBUG_REMOTE_HOST=localhost \
    XDEBUG_IDEKEY=docker \
    XDEBUG_VAR_DISPLAY_MAX_CHILDREN=128 \
    XDEBUG_VAR_DISPLAY_MAX_DATA=512 \
    XDEBUG_VAR_DISPLAY_MAX_DEPTH=5 \
    PHP_OPCACHE_ENABLED=1 \
    PHP_MEMORY_LIMIT=16M \
    PHP_POST_MAX_SIZE=32M \
    PHP_UPLOAD_MAX_FILESIZE=16M \
    PHP_ERROR_REPORTING="E_ALL & ~E_NOTICE & ~E_STRICT & ~E_DEPRECATED" \
    PHP_MAX_INPUT_VARS=2000
```

## Custom Caddy Configuration

To add your own configuration files, simply copy them to `/etc/docker-caddy/conf.d/`. They'll be loaded in alphabetical order.

## Runtime Configuration

This image follows the [Flexible Docker entrypoints scripts](http://www.camptocamp.com/en/actualite/flexible-docker-entrypoints-scripts/) format in that there is a `/docker-entrypoint.d` folder that contains all of the scripts that will be run at startup *before* anything is started. Internally, this is used to do some last minute tweaking of things based on the environment. You may add whatever scripts you want to this and they'll be run also. If your script is working, you'll see `run-parts` say that it is being executed when the application is booted. Something like:

```
run-parts: executing /docker-entrypoint.d/set-permissions
```