import 'package:flutter/material.dart';
import 'package:medicalsasistant/modules/main/view.dart';

import 'modules/medication/add_medication_page.dart';
import 'modules/medication/edit_medication_page.dart';
import 'modules/medication/medication_management_page.dart';
import 'modules/patient/add_patient_page.dart';
import 'modules/patient/edit_patient_page.dart';
import 'modules/patient/patient_management_page.dart';
import 'modules/prescription/add_prescription_page.dart';
import 'modules/prescription/prescription_management_page.dart';


class AppRouter {
  static const String homePageRoute = '/';
  static const String addMedicationPageRoute = '/add_medication';
  static const String editMedicationPageRoute = '/edit_medication';
  static const String medicationManagementPageRoute = '/medication_management';
  static const String addPatientPageRoute = '/add_patient';
  static const String editPatientPageRoute = '/edit_patient';
  static const String patientManagementPageRoute = '/patient_management';
  static const String addPrescriptionPageRoute = '/add_prescription';
  static const String editPrescriptionPageRoute = '/edit_prescription';
  static const String prescriptionManagementPageRoute = '/prescription_management';

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(builder: (_) => HomePage());
      case addMedicationPageRoute:
        return MaterialPageRoute(builder: (_) => AddMedicationPage());
      case editMedicationPageRoute:
        if (settings.arguments is int) {
          return MaterialPageRoute(
              builder: (_) => EditMedicationPage(medicationId: settings.arguments as  int ??0));
        }
        return null;
      case medicationManagementPageRoute:
        return MaterialPageRoute(builder: (_) => MedicationManagementPage());
      case addPatientPageRoute:
        return MaterialPageRoute(builder: (_) => AddPatientPage());
      case editPatientPageRoute:
        if (settings.arguments is int) {
          return MaterialPageRoute(
              builder: (_) => EditPatientPage(patientId: settings.arguments as int));
        }
        return null;
      case patientManagementPageRoute:
        return MaterialPageRoute(builder: (_) => PatientManagementPage());
      case addPrescriptionPageRoute:
        return MaterialPageRoute(builder: (_) => AddPrescriptionPage());
      case editPrescriptionPageRoute:
//        if (settings.arguments is int) {
//          return MaterialPageRoute(
//              builder: (_) => EditPrescriptionPage(prescriptionId: args));
//        }
        return null;
      case prescriptionManagementPageRoute:
        return MaterialPageRoute(builder: (_) => PrescriptionManagementPage());
      default:
        return null;

    }
  }
}
