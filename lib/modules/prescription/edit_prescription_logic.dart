//import 'package:flutter/material.dart';
//import 'package:medicalsasistant/models/prescription.dart';
//import 'package:medicalsasistant/database//database_helper.dart';
//
//class EditPrescriptionLogic extends ChangeNotifier {
//  DatabaseHelper databaseHelper;
//  Prescription prescription;
//  BuildContext context;
//
//  TextEditingController medicineController = TextEditingController();
//  TextEditingController quantityController = TextEditingController();
//  TextEditingController dosageController = TextEditingController();
//  TextEditingController durationController = TextEditingController();
//  TextEditingController remarksController = TextEditingController();
//
//  EditPrescriptionLogic({
//    required this.databaseHelper,
//    required this.prescription,
//    required this.context,
//  }) {
//    medicineController.text = prescription.medicine;
//    quantityController.text = prescription.quantity;
//    dosageController.text = prescription.dosage;
//    durationController.text = prescription.duration;
//    remarksController.text = prescription.remarks;
//  }
//
//  Future<void> updatePrescription() async {
//    prescription.medicine = medicineController.text;
//    prescription.quantity = quantityController.text;
//    prescription.dosage = dosageController.text;
//    prescription.duration = durationController.text;
//    prescription.remarks = remarksController.text;
//
//    await databaseHelper.updatePrescription(prescription);
//    Navigator.pop(context);
//  }
//}