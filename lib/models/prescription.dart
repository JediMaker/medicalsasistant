
import 'package:medicalsasistant/models/medication.dart';
import 'package:medicalsasistant/models/patient.dart';

class Prescription {
  int? id;
  String? patientName;
  String? medicationName;
  String? dosage;
  String? instructions;
  DateTime? datePrescribed;

  Prescription({
    this.id,
    this.patientName,
    this.medicationName,
    this.dosage,
    this.instructions,
    this.datePrescribed,
  });

  Map<String, dynamic> toMap() {
    final map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = id;
    }
    map['patientName'] = patientName;
    map['medicationName'] = medicationName;
    map['dosage'] = dosage;
    map['instructions'] = instructions;
//    map['datePrescribed'] = datePrescribed!.toIso8601String();
    return map;
  }

  factory Prescription.fromMap(Map<String, dynamic> map) {
    return Prescription(
      id: map['id'],
      patientName: map['patientName'],
      medicationName: map['medicationName'],
      dosage: map['dosage'],
      instructions: map['instructions'],
//      datePrescribed: DateTime.parse(map['datePrescribed']),
    );
  }

}
