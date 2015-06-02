sudo apt-get update -y
sudo apt-get install couchdb -y
curl localhost:5984

echo "Couchdb installed successfylly"

sudo docker run -d -p 5672:5672 -e RABBITMQ_NODENAME=titan rabbi --name titanrabbit rabbitmq:3
sudo docker run -d -e RABBITMQ_NODENAME=titanrabbit --name  titan-rabbit-mgmt -p 8080:15672 rabbitmq:3-management

echo "RabbitMQ installed successfylly"

