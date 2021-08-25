1. Create containers till composer
2. `docker-compose run --rm composer create-project --prefer-dist laravel/laravel .` to create the composer project
3. In the .env file of `/src/.env` update the mysql connection values to below
   - DB_CONNECTION=mysql
   - DB_HOST=mysql
   - DB_PORT=3306
   - DB_DATABASE=homestead
   - DB_USERNAME=homestead
   - DB_PASSWORD=secret
4. `docker-compose up -d server php mysql`
5. `docker-compose down`
6. `docker-compose up -d --build server` We have made server depends_on php and mysql in docker-compose.yaml.

---

1. After building all 6 containers do the following
2. `docker-compose run --rm artisan migrate`
