# mongod
# mongod--dbpath "miBaseMongo"


use miBaseMongo
# creamos las tablas mensajes y productos
db.createCollection("mensajes")
db.createCollection("productos")

# 1 - Insertamos los productos
db.productos.insertMany([
  { name: "Rosa", price: 8000, stock: 20 },
  { name: "Margarita", price: 90000 , stock: 20},
  { name: "Hibisco", price: 5520 , stock: 20},
  { name: "Hortensia", price: 6300 , stock: 20},
  { name: "Dalia", price: 9880, stock: 20 },
  { name: "Jazmin", price: 12000, stock: 20 },
  { name: "Lirio amarillo", price: 8000, stock: 20 },
  { name: "Azalea", price: 90000 , stock: 20},
  { name: "Aleli", price: 5520 , stock: 20},
  { name: "Cala", price: 6300 , stock: 20},
  
])

# 1 - Insertamos los mensajes
db.mensajes.insertMany([
{email: "valentina@mail.com", message: "AAAAAAAA", date: "7/1/2022, 1:28:05"},
{email: "valeria@mail.com", message: "BBBBBBBB", date: "18/7/2022 11:13:23",},
{email: "emilia@mail.com", message: "CCCCCCCCCC", date: "7/18/2022, 2:17:40",},
{email: "juana@website.com", message: "DDDDDDDDDDDD", date: "18/7/2022 11:20:47"},
{email: "carlos@website.com", message: "EEEEEEEEEEE", date: "18/7/2022 11:29:43"},
{email: "rita@mail.com", message: "FFFFFFF", date: "18/7/2022 11:30:39"},
{email: "candela@website.com", message: "GGGGGGGGGGG", date: "18/7/2022 11:32:12"},
{email: "lucio@website.com", message: "HHHHHHH", date: "18/7/2022 11:33:13"},
{email: "ignacio@webmail.com", message: "IIIIIIIIII", date: "18/7/2022 11:36:01"},
{email: "robert@mail.com", message: "JJJJJJJJJJJ", date: "18/7/2022 11:37:39"},
])

# Listanos los mensajes y formateamos
db.mensajes.find().pretty()
# Listamos los productos y formateamos
db.productos.find().pretty()

# contamos la cantidades de documentos que tienen las colecciones 
db.mensajes.estimatedDocumentCount()
db.productos.estimatedDocumentCount()

# CRUD 
# 5 (a) - Insertar un nuevo producto
db.productos.insertOne({title: "Calendula",price: 1245,   })
# 5 (b) - Realizar una consulta por nombre de producto específico
db.productos.find({title: "Calendula"}).pretty()

# 5 (b -1) - Listar todos los productos que tengan un precio menor a 1000
db.productos.find({price: {$lt: 1000}}).pretty()

# 5 (b -2) - Listar todos los productos que tengan un precio entre 1000 a 3000
db.productos.find({price: {$gt: 1000, $lt: 3000}}).pretty()

# 5 (b -3) - Listar todos los productos que tengan un precio mayor a 3000
db.productos.find({ price: {$gt: 3000}}).pretty()

# 5 (b -4) - Mostrar el nombre del tercer producto mas barato
{db.productos.find({}, { title: 1}).sort({price: 1}).skip(2).limit(1).pretty()}

# 5 (c) Actualizar todos los productos agregando el campo stock con un valor de 100
db.productos.updateMany({}, {$set: {stock: 100}})

# 5 (d) Cambiar el stock a 0 a los productos con el precio mayor a 4000
db.productos.updateMany({price: {$gt: 4000}}, {$set: {stock: 0}})

# 5 (e) Borrar los productos con el precio menor a 1000
db.productos.deleteMany({price: {$lt: 1000}})

use miBaseMongo

--db.createUser({
--user: "pepe",
--pwd: "asd456",
--roles: [{ role: "read", db: "miBaseMongo"}]
--})