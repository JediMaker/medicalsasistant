import 'package:medicalsasistant/database/database_helper.dart';
import 'package:medicalsasistant/models/medication.dart';

class EditMedicationLogic {
  final _databaseHelper = DatabaseHelper();

  Future<Medication?> getMedicationById(int id) async {
    return await _databaseHelper!.getMedicationById(id!);
  }

  Future<void> updateMedication(Medication medication) async {
    await _databaseHelper.updateMedication(medication);
  }
}
