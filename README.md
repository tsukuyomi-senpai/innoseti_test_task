# innoseti_test_task
Репозиторий с тестовым заданием


Чтобы не загружать все зависимости, можно использовать докер

docker build -t {name} .


docker run -p 80:5000 {name}


Тестовый запрос: 
curl -X POST 127.0.0.1:5000/api/login -H "Content-Type: application/json" -H "Authorization: token" -d '{"password":"secret", "username":"user"}'
