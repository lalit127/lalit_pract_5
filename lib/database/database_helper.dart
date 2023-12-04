import 'dart:async';

import 'package:lalit_pract_5/model/resume_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  late Database _database;

  Future<void> initializeDatabase() async {
    if (_database != null) {
      return;
    }

    // Get the path to the database
    String path = join(await getDatabasesPath(), 'resume_database.db');

    // Open the database
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create the resume table
        await db.execute(
          'CREATE TABLE resumes(id INTEGER PRIMARY KEY, userName TEXT, phoneNumber TEXT, socialLinksList TEXT, skillsList TEXT, experienceList TEXT)',
        );
      },
    );
  }

  // Add Resume or Update Resume
  Future<void> insertResume(ResumeModel resume) async {
    await _database.insert(
      'resumes',
      resume.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteResume(int id) async {
    await _database.delete(
      'resumes',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  //Retrieve All Resume
  Future<List<ResumeModel>> getAllResumes() async {
    final List<Map<String, dynamic>> maps = await _database.query('resumes');

    return List.generate(
      maps.length,
          (i) {
        return ResumeModel(
          userName: maps[i]['userName'],
          phoneNumber: maps[i]['phoneNumber'],
          socialLinksList: (maps[i]['socialLinksList'] as String).split(','),
          skillsList: (maps[i]['skillsList'] as String).split(','),
          experienceList: (maps[i]['experienceList'] as String).split(','),
        );
      },
    );
  }

}
