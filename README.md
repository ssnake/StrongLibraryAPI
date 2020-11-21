# README

Steps are necessary to get the application up and running.

## Getting Started Steps

```bash
docker volume create --name=pgdata
```

```bash
docker-compose run dev bundle install
```

```bash
docker-compose run dev yarn install --check-files
```

```bash
docker-compose exec dev rake db:create
```

```bash
docker-compose exec dev rake db:migrate
```

```bash
docker-compose up dev
```
