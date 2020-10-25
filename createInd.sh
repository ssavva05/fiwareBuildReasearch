printf "Adding appropriate \033[1mMongoDB\033[0m indexes for \033[1;34mOrion\033[0m  ..."
docker exec  db-mongo mongo --eval '
conn = new Mongo();db.createCollection("orion");
db = conn.getDB("orion");
db.createCollection("entities");
db.entities.createIndex({"_id.servicePath": 1, "_id.id": 1, "_id.type": 1}, {unique: true});
db.entities.createIndex({"_id.type": 1}); 
db.entities.createIndex({"_id.id": 1});' > /dev/null

docker exec  db-mongo mongo --eval '
conn = new Mongo();db.createCollection("orion-openiot");
db = conn.getDB("orion-openiot");
db.createCollection("entities");
db.entities.createIndex({"_id.servicePath": 1, "_id.id": 1, "_id.type": 1}, {unique: true});
db.entities.createIndex({"_id.type": 1}); 
db.entities.createIndex({"_id.id": 1});' > /dev/null
echo -e " \033[1;32mdone\033[0m"

printf "Adding appropriate \033[1mMongoDB\033[0m indexes for \033[1;36mIoT-Agent\033[0m  ..."
docker exec  db-mongo mongo --eval '
conn = new Mongo();
db = conn.getDB("iotagentul");
db.createCollection("devices");
db.devices.createIndex({"_id.service": 1, "_id.id": 1, "_id.type": 1});
db.devices.createIndex({"_id.type": 1}); 
db.devices.createIndex({"_id.id": 1});
db.createCollection("groups");
db.groups.createIndex({"_id.resource": 1, "_id.apikey": 1, "_id.service": 1});
db.groups.createIndex({"_id.type": 1});' > /dev/null
echo -e " \033[1;32mdone\033[0m"
