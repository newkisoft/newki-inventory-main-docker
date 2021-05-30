sudo docker stop $(sudo docker ps -aq -f name=inventory-main)
sudo docker rm $(sudo docker ps -aq -f name=inventory-main) 
#sudo docker rmi newki/inventory:1.1 
sudo docker build -t newki/inventory:1.1  . 
sudo docker run --name inventory-main --network host -i -d newki/inventory:1.1 
sudo docker exec -w /newki-inventory-publish/ inventory-main git pull 
sudo docker exec -d -w /newki-inventory-publish/ inventory-main cp production.settings.json appsettings.Production.json
sudo docker exec -d -w /newki-inventory-publish/ inventory-main dotnet inventory.dll 

