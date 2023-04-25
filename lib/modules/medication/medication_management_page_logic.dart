import 'package:flutter/material.dart';

import 'add_medication_page.dart';
import 'edit_medication_page.dart';
import 'package:medicalsasistant/database/database_helper.dart';
import 'package:medicalsasistant/models/medication.dart';

class MedicationManagementPageLogic {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<Medication> medications = [];

  Future<void> getMedications() async {
    medications = await _databaseHelper.getAllMedications();
  }

  Future<void> searchMedications(String query) async {
    medications = await _databaseHelper.searchMedications(query);
  }

  void navigateToAddMedicationPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddMedicationPage()),
    );

    if (result == true) {
      await getMedications();
      setState();
    }
  }

  void navigateToEditMedicationPage(BuildContext context, Medication medication) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditMedicationPage(medication: medication)),
    );

    if (result == true) {
      await getMedications();
      setState();
    }
  }

  Future<void> deleteMedication(int id) async {
    await _databaseHelper.deleteMedication(id);
    await getMedications();
    setState();
  }

  void setState() {
    // do nothing
  }
}
