FROM composer:2.2

WORKDIR /app

COPY . .

RUN composer install --ignore-platform-reqs --prefer-dist --no-scripts \
 --no-progress --no-suggest --no-interaction --no-dev --no-autoloader

RUN docker-php-ext-install pdo_mysql

CMD php artisan migrate --force --seed & php artisan serve --host=0.0.0.0 --port=8080

