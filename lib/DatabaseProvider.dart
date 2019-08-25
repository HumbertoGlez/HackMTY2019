import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/FacturaModel';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  DBProvider._();

  static final DBProvider db = DBProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // if _database is null we instantiate it
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE Factura ("
              "uuid TEXT PRIMARY KEY,"
              "rfc TEXT,"
              "ccyisocode TEXT,"
              "ccyfx TEXT,"
              "paymentmethod INTEGER"
              "paymenttype TEXT,"
              "productid INTEGER,"
              "quantity INTEGER,"
              "cost REAL,"
              "subtotal REAL,"
              "total REAL,"
              "iva REAL,"
              "placegenerated TEXT,"
              "date TEXT,"
              "receptorrfc TEXT,"
              "receptorname TEXT,"
              "emisorrfc TEXT,"
              "emisorname TEXT,"
              "status TEXT,"
              "tipo TEXT,"
              ")");
        });
  }

  newFactura(Factura newFactura) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery("SELECT MAX(uuid)+1 as id FROM F");
    int uuid = table.first["uuid"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into Factura (uuid, rfc, ccyisocode, ccyfx, paymentmethod, paymenttype, productid, quantity, cost, subtotal, total, iva, placegenerated, date, receptorrfc, receptorname, emisorrfc, emisorname, status, tipo)"
            "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
        [newFactura.uuid, newFactura.rfc, newFactura.ccyisocode, newFactura.ccyfx, newFactura.paymentmethod, newFactura.paymenttype, newFactura.productid, newFactura.quantity, newFactura.cost, newFactura.subtotal, newFactura.total, newFactura.iva, newFactura.placegenerated, newFactura.date, newFactura.receptorrfc, newFactura.receptorname, newFactura.emisorrfc, newFactura.emisorname, newFactura.status, newFactura.tipo]);
    return raw;
  }

  blockOrUnblock(Client client) async {
    final db = await database;
    Client blocked = Client(
        id: client.id,
        firstName: client.firstName,
        lastName: client.lastName,
        blocked: !client.blocked);
    var res = await db.update("Client", blocked.toMap(),
        where: "id = ?", whereArgs: [client.id]);
    return res;
  }

  updateClient(Client newClient) async {
    final db = await database;
    var res = await db.update("Client", newClient.toMap(),
        where: "id = ?", whereArgs: [newClient.id]);
    return res;
  }

  getClient(int id) async {
    final db = await database;
    var res = await db.query("Client", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? Client.fromMap(res.first) : null;
  }

  Future<List<Client>> getBlockedClients() async {
    final db = await database;

    print("works");
    // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
    var res = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);

    List<Client> list =
    res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  Future<List<Client>> getAllClients() async {
    final db = await database;
    var res = await db.query("Client");
    List<Client> list =
    res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }

  deleteClient(int id) async {
    final db = await database;
    return db.delete("Client", where: "id = ?", whereArgs: [id]);
  }

  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }
}