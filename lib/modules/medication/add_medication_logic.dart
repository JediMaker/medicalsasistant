import 'package:medicalsasistant/database/database_helper.dart';
import 'package:medicalsasistant/models/medication.dart';

class AddMedicationLogic {
  final _databaseHelper = DatabaseHelper();

  Future<void> saveMedication(Medication medication) async {
    await _databaseHelper.insertMedication(medication);
  }
}
