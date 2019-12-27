# PostgreSQL 12 docker image

```bash
docker pull lyncsystem/postgres-12-rus
```

В [оригинальный образ](https://hub.docker.com/_/postgres) добавлено:

* локаль ru_RU.UTF-8
* часовой пояс Europe/Moscow (переопределяется переменной окружения `TZ`)
* расширения [PostGIS](https://postgis.net/), [RUM индекс](https://github.com/postgrespro/rum), [русские словари](https://github.com/postgrespro/hunspell_dicts/tree/master/hunspell_ru_ru) для полнотекстового поиска

Расширения устанавливаются как обычно

```sql
CREATE EXTENSION postgis;
CREATE EXTENSION rum;
CREATE EXTENSION hunspell_ru_ru;
CREATE EXTENSION jsquery;
```

Со словарями работать примерно так

```sql
=> SELECT ts_lexize('russian_hunspell', 'истории');
 ts_lexize
-----------
 {история}
(1 row)
```

подробности о словаре [здесь](https://github.com/postgrespro/hunspell_dicts)
- Установка драйвера томов.
- install persist plugin data.
- curl -fsSL https://raw.githubusercontent.com/MatchbookLab/local-persist/master/scripts/install.sh | sudo bash.

## DOCKER-COMPOSE:
```
version: '3.7'
services:
  pgsql12:
    container_name: postgresql12-ru
    image: lyncsystem/postgresql:12
    ports:
      - 55432:5432
    volumes:
      - postgresql_data:/var/lib/postgresql/data
    environment:
      - "POSTGRES_PASSWORD=53398715"

volumes:
  postgresql_data:
    driver: local-persist
    driver_opts:
      mountpoint: /var/lib/postgresql/data
```
