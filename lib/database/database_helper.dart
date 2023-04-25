import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'package:medicalsasistant/models/medication.dart';
import 'package:medicalsasistant/models/patient.dart';
import 'package:medicalsasistant/models/prescription.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _db;

  DatabaseHelper._instance();
  factory DatabaseHelper() => instance;


  String medicationsTable = 'medications';
  String colMedicationId = 'id';
  String colMedicationName = 'name';
  String colMedicationDescription = 'description';
  String colMedicationDosage = 'dosage';

  String patientsTable = 'patients';
  String colPatientId = 'id';
  String colPatientName = 'name';
  String colPatientGender = 'gender';
  String colPatientAge = 'age';
  String colPatientPhoneNumber = 'phoneNumber';
  String colPatientAddress = 'address';

  String prescriptionsTable = 'prescriptions';
  String colPrescriptionId = 'id';
  String colPrescriptionPatient = 'patientName';
  String colPrescriptionMedications = 'medications';
  String colPrescriptionNotes = 'notes';

  Future<Database> get db async {
    if (_db == null) {
      _db = await _initDb();
    }
    return _db!;
  }

  Future<Database> _initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'medical_assistant.db');

    final sqLiteDb = await openDatabase(
      path,
      version: 1,
      onCreate: _createDb,
    );

    return sqLiteDb;
  }

  void _createDb(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE $medicationsTable(
        $colMedicationId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colMedicationName TEXT,
        $colMedicationDescription TEXT,
        $colMedicationDosage TEXT
      )
      ''',
    );
    await db.execute(
      '''
      CREATE TABLE $patientsTable(
        $colPatientId INTEGER PRIMARY KEY AUTOINCREMENT,
        $colPatientName TEXT,
        $colPatientGender INTEGER,
        $colPatientAge INTEGER,
        $colPatientPhoneNumber TEXT,
        $colPatientAddress TEXT
      )
      ''',
    );
    await db.execute(
      '''
      CREATE TABLE $prescriptionsTable(
        $colPrescriptionId INTEGER PRIMARY KEY AUTOINCREMENT,

        $colPrescriptionMedications TEXT,
        $colPrescriptionNotes TEXT
      )
      ''',
    );
  }

  Future<int> insertMedication(Medication medication) async {
    final db = await this.db;
    final result = await db.insert(medicationsTable, medication.toMap());
    return result;
  }

  Future<int> updateMedication(Medication medication) async {
    final db = await this.db;
    final result = await db.update(
      medicationsTable,
      medication.toMap(),
      where: '$colMedicationId = ?',
      whereArgs: [medication.id],
    );
    return result;
  }

  Future<int> deleteMedication(int id) async {
    final db = await this.db;
    final result = await db.delete(
      medicationsTable,
      where: '$colMedicationId = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<List<Medication>> getAllMedications() async {
    final db = await this.db;
    final result = await db.query(medicationsTable);
    final List<Medication> medications = result.isNotEmpty
        ? result.map((map) => Medication.fromMap(map)).toList()
        : [];
    return medications;
  }

  Future<List<Medication>> searchMedications(String query) async {
    final db = await this.db;
    final result = await db.rawQuery(
        "SELECT * FROM $medicationsTable WHERE $colMedicationName LIKE '%$query%'");
    final List<Medication> medications = result.isNotEmpty
        ? result.map((map) => Medication.fromMap(map)).toList()
        : [];
    return medications;
  }
  Future<Medication?> getMedicationById(int id) async {
    final db = await this.db;
    final result = await db.query(
      medicationsTable,
      where: '$colMedicationId = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? Medication.fromMap(result.first) : null;
  }

  Future<Patient?> getPatientById(int id) async {
    final db = await this.db;
    final result = await db.query(
      patientsTable,
      where: '$colPatientId = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? Patient.fromMap(result.first) : null;
  }

  Future<Prescription?> getPrescriptionById(int id) async {
    final db = await this.db;
    final result = await db.query(
      prescriptionsTable,
      where: '$colPrescriptionId = ?',
      whereArgs: [id],
    );
    return result.isNotEmpty ? Prescription.fromMap(result.first) : null;
  }


  Future<int> insertPatient(Patient patient) async {
    final db = await this.db;
    final result = await db.insert(patientsTable, patient.toMap());
    return result;
  }

  Future<int> updatePatient(Patient patient) async {
    final db = await this.db;
    final result = await db.update(
      patientsTable,
      patient.toMap(),
      where: '$colPatientId = ?',
      whereArgs: [patient.id],
    );
    return result;
  }

  Future<int> deletePatient(int id) async {
    final db = await this.db;
    final result = await db.delete(
      patientsTable,
      where: '$colPatientId = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<List<Patient>> getAllPatients() async {
    final db = await this.db;
    final result = await db.query(patientsTable);
    final List<Patient> patients = result.isNotEmpty
        ? result.map((map) => Patient.fromMap(map)).toList()
        : [];
    return patients;
  }

  Future<List<Patient>> searchPatients(String query) async {
    final db = await this.db;
    final result = await db.rawQuery(
        "SELECT * FROM $patientsTable WHERE $colPatientName LIKE '%$query%'");
    final List<Patient> patients = result.isNotEmpty
        ? result.map((map) => Patient.fromMap(map)).toList()
        : [];
    return patients;
  }

  Future<int> insertPrescription(Prescription prescription) async {
    final db = await this.db;
    final result = await db.insert(prescriptionsTable, prescription.toMap());
    return result;
  }

  Future<int> updatePrescription(Prescription prescription) async {
    final db = await this.db;
    final result = await db.update(
      prescriptionsTable,
      prescription.toMap(),
      where: '$colPrescriptionId = ?',
      whereArgs: [prescription.id],
    );
    return result;
  }

  Future<int> deletePrescription(int id) async {
    final db = await this.db;
    final result = await db.delete(
      prescriptionsTable,
      where: '$colPrescriptionId = ?',
      whereArgs: [id],
    );
    return result;
  }

  Future<List<Prescription>> getAllPrescriptions() async {
    final db = await this.db;
    final result = await db.query(prescriptionsTable);
    final List<Prescription> prescriptions = result.isNotEmpty
        ? result.map((map) => Prescription.fromMap(map)).toList()
        : [];
    return prescriptions;
  }

  Future<List<Prescription>> searchPrescriptions(String query) async {
    final db = await this.db;
    final result = await db.rawQuery(
        "SELECT * FROM $prescriptionsTable WHERE $colPrescriptionNotes LIKE '%$query%'");
    final List<Prescription> prescriptions = result.isNotEmpty
        ? result.map((map) => Prescription.fromMap(map)).toList()
        : [];
    return prescriptions;
  }
}

