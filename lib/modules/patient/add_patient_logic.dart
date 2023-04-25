import 'package:flutter/material.dart';
import 'package:medicalsasistant/models/patient.dart';
import 'package:medicalsasistant/database//database_helper.dart';

class AddPatientLogic {
  final DatabaseHelper? databaseHelper;
  final BuildContext context;

  AddPatientLogic({this.databaseHelper, context}) : this.context = context {
    // 在此处就可以访问 context 变量了
  }

  Future<Patient?> addPatient({
    required String name,
    required int age,
    required String gender,
    required String phoneNumber,
    required String address,
  }) async {
    final patient = Patient(
      name: name,
      age: age,
      gender: gender,
      phoneNumber: phoneNumber,
      address: address,
    );

    final id = await databaseHelper!.insertPatient(patient);

    if (id != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Patient added')),
      );

      return patient.copyWith(id: id);

    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add patient')),
      );

      return null;
    }
  }
}
