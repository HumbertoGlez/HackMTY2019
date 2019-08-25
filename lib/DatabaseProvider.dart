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
        [
          newFactura.uuid,
          newFactura.rfc,
          newFactura.ccyisocode,
          newFactura.ccyfx,
          newFactura.paymentmethod,
          newFactura.paymenttype,
          newFactura.productid,
          newFactura.quantity,
          newFactura.cost,
          newFactura.subtotal,
          newFactura.total,
          newFactura.iva,
          newFactura.placegenerated,
          newFactura.date,
          newFactura.receptorrfc,
          newFactura.receptorname,
          newFactura.emisorrfc,
          newFactura.emisorname,
          newFactura.status,
          newFactura.tipo
        ]);
    return raw;
  }

  Future<int> numberClients() async {
    final db = await database;
    var num = await db.rawQuery(
        "SELECT COUNT(uuid) FROM Factura WHERE tipo='venta' GROUP BY uuid");
    var count = num[0].values.elementAt(0);
    return count;
  }
}