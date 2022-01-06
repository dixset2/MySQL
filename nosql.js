SADD ip '127.0.0.1' '127.0.0.2' '127.0.0.3'
SMEMBERS ip /* Список уникальных айпи */
SCARD ip /* Кол-во айпи */

set dixset2@gmail.com max
set max dixset2@gmail.com

get dixset2@gmail.com
get max

use products
db.products.insert({"name": "Intel Core i5-7400", "description": "Процессор для настольных ПК", "price": "12700.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()})
db.products.insertMany([
    {"name": "AMD FX-8320", "description": "Процессор для настольных ПК", "price": "4780.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()},
    {"name": "AMD FX-8320E", "description": "Процессор для настольных ПК", "price": "7120.00", "catalog_id": "Процессоры", "created_at": new Date(), "updated_at": new Date()}])

db.products.find().pretty()
db.products.find({name: "AMD FX-8320"}).pretty()

use catalogs
db.catalogs.insertMany([{"name": "Процессоры"}, {"name": "Мат.платы"}, {"name": "Видеокарты"}])
