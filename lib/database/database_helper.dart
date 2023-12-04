import 'dart:async';
import 'dart:io';
import 'package:lalit_pract_5/model/resume_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';


class DatabaseHelper {

  static const dbName = "resume.db";
  static const dbVersion = 1;
  static const dbTable = "resTable";
  static const String id = 'id';
  static const String userName = 'userName';
  static const String phoneNumber = 'phoneNumber';
  static const String socialLinksList = 'socialLinksList';
  static const String skillsList = 'skillsList';
  static const String experienceList = 'experienceList';

  static final DatabaseHelper databaseHelper = DatabaseHelper();

  static Database? _database;

  Future<Database?> get database async{
    _database??=await initializeDatabase();
    return _database;
  }


  initializeDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,dbName);

    return await openDatabase(path,version:dbVersion,onCreate: onCreate);
  }

  Future onCreate(Database db, int version) async {
    try {
      await db.execute(
          '''
      CREATE TABLE $dbTable(
        $id INTEGER PRIMARY KEY,
        $userName TEXT NOT NULL,
        $phoneNumber TEXT NOT NULL,
        $skillsList TEXT NOT NULL,
        $socialLinksList TEXT NOT NULL,
        $experienceList TEXT NOT NULL
      )
      '''
      );
    } catch (e) {
      print("Error creating table: $e");
    }
  }

  // Add Resume or Update Resume
  insertResume(ResumeModel resume) async {
    Database? db = await databaseHelper.database;
    return await db!.insert(
      dbTable,
      resume.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

   deleteResume(int id) async {
     Database? db = await databaseHelper.database;
    return await db!.delete(
      dbTable,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Retrieve All Resume
  Future<List<Map<String, dynamic>>> getAllResumes() async {
    Database? db = await databaseHelper.database;
    return db!.query(dbTable);
  }
}
