import 'package:flutter/material.dart';

import 'package:medicalsasistant/database/database_helper.dart';
import 'package:medicalsasistant/models/prescription.dart';
import 'add_prescription_page.dart';
import 'edit_prescription_page.dart';

class PrescriptionManagementPageLogic {
  final DatabaseHelper _databaseHelper = DatabaseHelper();

  List<Prescription> prescriptions = [];

  Future<void> getPrescriptions() async {
    prescriptions = await _databaseHelper.getAllPrescriptions();
  }

  Future<void> searchPrescriptions(String query) async {
    prescriptions = await _databaseHelper.searchPrescriptions(query);
  }

  void navigateToAddPrescriptionPage(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => AddPrescriptionPage()),
    );

    if (result == true) {
      await getPrescriptions();
      setState();
    }
  }

  void navigateToEditPrescriptionPage(BuildContext context, Prescription prescription) async {/*
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => EditPrescriptionPage(prescriptionId: prescription.id)),
    );

    if (result == true) {
      await getPrescriptions();
      setState();
    }*/
  }

  Future<void> deletePrescription(int id) async {
    if(id==0) return;
    await _databaseHelper.deletePrescription(id);
    await getPrescriptions();
    setState();
  }

  void setState() {
    // do nothing
  }
}
