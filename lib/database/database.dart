import 'dart:async';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todolist_app/models/Note.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Future<Database> database = openDatabase(
    join(await getDatabasesPath(), 'todolist.db'),
    onCreate: (db, version) {
      db.execute("CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT, color TEXT, time DATETIME)");
      db.execute("CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, description TEXT)");
      db.execute("CREATE TABLE checklists(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, check INTEGER DEFAULT 0)");
      return;
    },
    version: 1,
  );

  Future<void> insertNote(Note note) async {
    final Database db = await database;
    await db.insert(
      'notes',
      note.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Note>> notes() async {
    final Database db = await database;

    final List<Map<String, dynamic>> maps = await db.query('dogs');

    return List.generate(maps.length, (i) {
      return Note(maps[i]['title'],maps[i]['description'],);
    });
  }
  //
  // Future<void> updateDog(Dog dog) async {
  //   final db = await database;
  //
  //   await db.update(
  //     'dogs',
  //     dog.toMap(),
  //     where: "id = ?",
  //     whereArgs: [dog.id],
  //   );
  // }

  // Future<void> deleteDog(int id) async {
  //   final db = await database;
  //   await db.delete(
  //     'dogs',
  //     where: "id = ?",
  //     whereArgs: [id],
  //   );
  // }

  final test = Note("test", "test");
  await insertNote(test);

  print(await notes());
//
//   fido = Dog(
//     id: fido.id,
//     name: fido.name,
//     age: fido.age + 7,
//   );
//   await updateDog(fido);
//
//   // Print Fido's updated information.
//   print(await dogs());
//
//   // Delete Fido from the database.
//   await deleteDog(fido.id);
//
//   // Print the list of dogs (empty).
//   print(await dogs());
// }
//
// class Dog {
//   final int id;
//   final String name;
//   final int age;
//
//   Dog({this.id, this.name, this.age});
//
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'name': name,
//       'age': age,
//     };
//   }
//
//   @override
//   String toString() {
//     return 'Dog{id: $id, name: $name, age: $age}';
//   }
}