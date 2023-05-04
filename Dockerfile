FROM composer:2.2

WORKDIR /app

COPY . .

RUN composer update --ignore-platform-reqs

RUN docker-php-ext-install pdo_mysql

CMD php artisan migrate --force --seed & php artisan serve --host=0.0.0.0 --port=8080

