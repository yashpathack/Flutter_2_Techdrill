import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqftry/src/models/person_model.dart';
import 'dart:async';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  // Opening a databse
  final Future<Database> database =
      openDatabase(join(await getDatabasesPath(), 'person_data.db'), version: 1,
          onCreate: (db, version) {
    return db.execute("""
      CREATE TABLE persons(
        id INTEGER PRIMARY KEY,
        age INTEGER,
        name TEXT
      )
      """);
  });

  Future<void> insertPerson(Person person) async { //INSERT
    final Database db = await database;

    await db.insert(
      'persons',
      person.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Person>> persons() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('persons');

    return List.generate(maps.length, (index) {
      return Person(
        age: maps[index]['age'],
        name: maps[index]['name'],
        id: maps[index]['id'],
      );
    });
  }

  //C R U D
  //
  Future<void> updatePerson(Person person) async { //UPDATE
    final Database db = await database;

    await db.update('persons', person.toMap(),
        where: "id = ?", whereArgs: [person.id]);
  }



  Future <void> deletePerson(int id) async{ //DELETE
final Database db = await database;
    await db.delete('persons',
    
    where: "id = ?",
    whereArgs: [id],
    );
  }


  var someguy = new Person(
    name: "Sam",
    age: 34,
    id: 0
  );

  await insertPerson(someguy);
  print(await persons());

  someguy = new Person(
    name: someguy.name,
    age: someguy.age + 16, //34
    id: someguy.id
  );

  await updatePerson(someguy);
  print(await persons());


  await deletePerson(someguy.id);
  print(await persons());



}
