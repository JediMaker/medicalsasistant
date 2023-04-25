import 'package:flutter/material.dart';

import 'package:medicalsasistant/database/database_helper.dart';
import 'package:medicalsasistant/models/patient.dart';
import 'add_patient_page.dart';
import 'edit_patient_page.dart';

class PatientManagementPageLogic {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<Patient> patients = [];

  Future<void> getPatients() async {
    patients = await _databaseHelper.getAllPatients();
  }

  Future<void> searchPatients(String query) async {
    patients = await _databaseHelper.searchPatients(query);
  }

  void navigateToAddPatientPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddPatientPage()),
    );

    if (result == true) {
      await getPatients();
      setState();
    }
  }

  void navigateToEditPatientPage(BuildContext context, Patient patient) async {
    final result = await Navigator.push(
        context,
      MaterialPageRoute(builder: (_) => EditPatientPage(patientId: patient.id)),
    );

    if (result == true) {
      await getPatients();
      setState();
    }
  }

  Future<void> deletePatient(int id) async {
    await _databaseHelper.deletePatient(id);
    await getPatients();
    setState();
  }

  void setState() {
    // do nothing
  }
}
