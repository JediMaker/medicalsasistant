import 'package:flutter/material.dart';
import 'package:medicalsasistant/database/database_helper.dart';
import 'package:medicalsasistant/models/patient.dart';

class EditPatientLogic {
  final BuildContext context;
  final int patientId;
  final DatabaseHelper databaseHelper = DatabaseHelper();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? name;
  int? age;
  String? gender;
  String? phoneNumber;
  String? address;

  EditPatientLogic({required this.context, required this.patientId}) {
    _loadPatientData();
  }

  // 从数据库中加载患者信息
  Future<void> _loadPatientData() async {
    final patient = await databaseHelper.getPatientById(patientId);

      name = patient!.name;
      age = patient.age;
      gender = patient.gender;
      phoneNumber = patient.phoneNumber;
      address = patient.address;
  }

  // 更新患者信息到数据库中
  Future<void> updatePatient() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      form.save();
      final updatedPatient = Patient(
        id: patientId,
        name: name,
        age: age,
        gender: gender,
        phoneNumber: phoneNumber,
        address: address,
      );
      await databaseHelper.updatePatient(updatedPatient);
      Navigator.pop(context);
    }
  }
}
