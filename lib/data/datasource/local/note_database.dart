import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:note_application/data/datasource/local/dao/category_dao.dart';
import 'package:note_application/data/datasource/local/dao/note_dao.dart';
import 'package:note_application/data/datasource/local/entity/category.dart';
import 'package:note_application/data/datasource/local/entity/note.dart';

part 'note_database.g.dart';

@Database(version: 1, entities: [Note, Category])
abstract class NoteDatabase extends FloorDatabase {
  NoteDao get noteDao;
  CategoryDao get categoryDao;
}
