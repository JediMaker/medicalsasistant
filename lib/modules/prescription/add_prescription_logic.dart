import 'package:flutter/material.dart';
import 'package:medicalsasistant/models/prescription.dart';
import 'package:medicalsasistant/database//database_helper.dart';

class AddPrescriptionLogic {
  final DatabaseHelper? databaseHelper;
  String? medicationName;
  String ?dosage;
  String? instructions;

  AddPrescriptionLogic({ this.databaseHelper});

  void addPrescription(Prescription prescription) async {
    await databaseHelper!.insertPrescription(prescription);
  }
}
