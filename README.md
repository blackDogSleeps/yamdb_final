![BADGE](https://github.com/blackDogSleeps/yamdb_final/actions/workflows/yamdb_workflow.yml/badge.svg)

Адрес проекта: http://notadiary.ddns.net/api/v1/


# Yamdb project
Учебный проект по созданию социальной сети для обсуждения художественных произведений: кино, книг, видеоигр и пр.
Реализованы: регистрация, авторизация, создание постов, добавление групп, комментарии постов, подписки на авторов.

## Как запустить проект:
Клонировать репозиторий и перейти в него в командной строке:
```
git clone git@github.com:blackDogSleeps/infra_sp2.git
cd infra_sp2
```

Собрать стэк контейнеров:
```
cd infra
docker-compose up -d --build
```

После сборки посмотреть id контейнера infra_web:
```
docker container ls -a
```

Перейти в контейнер infra_web:
```
docker exec -it <id контейнера> bash
```

Выполнить миграции:
```
python manange.py migrate
```

Восстановить базу данных:
```
python manage.py loaddata fixtures.json
```

Зарегистрировать нового пользователя:
```
/api/v1/auth/signup/
{
    "email": "user@example.com",
    "username": "string"
}
```

Взять код подтверждения:
```
cd sent_emails
cat <имя файла с логом>.log
```

Получить токен:
```
/api/v1/auth/token/
{
    "username": "string",
    "confirmation_code": "string"

}
```

## Примеры запросов к API
`GET` /api/v1/posts/
```
{
  "count": 123,
  "next": "http://api.example.org/accounts/?offset=400&limit=100",
  "previous": "http://api.example.org/accounts/?offset=200&limit=100",
  "results": [
    {
      "id": 0,
      "author": "string",
      "text": "string",
      "pub_date": "2021-10-14T20:41:29.648Z",
      "image": "string",
      "group": 0
    }
  ]
}
```
`GET` /api/v1/posts/{id}
```
{
  "id": 0,
  "author": "string",
  "text": "string",
  "pub_date": "2019-08-24T14:15:22Z",
  "image": "string",
  "group": 0
}
```
`GET` /api/v1/posts/{post_id}/comments/
```
[
  {
    "id": 0,
    "author": "string",
    "text": "string",
    "created": "2019-08-24T14:15:22Z",
    "post": 0
  }
]
```
`POST` /api/v1/posts/{post_id}/comments/

Request samples
```
{
  "text": "string"
}
```
Response samples
```
{
  "id": 0,
  "author": "string",
  "text": "string",
  "created": "2019-08-24T14:15:22Z",
  "post": 0
}
```
`POST` /api/v1/follow/

Request samples
```
{
  "following": "string"
}
```
Response samples
```
{
  "user": "string",
  "following": "string"
}
```
`POST` /api/v1/jwt/create/

Request samples
```
{
  "username": "string",
  "password": "string"
}
```
Response samples
```
{
  "refresh": "string",
  "access": "string"
}
```
