//import 'package:flutter/material.dart';
//import 'package:getwidget/components/button/gf_button.dart';
//import 'package:medicalsasistant/models/medication.dart';
//import 'package:medicalsasistant/models/patient.dart';
//import 'package:medicalsasistant/models/prescription.dart';
//import 'package:medicalsasistant/database//database_helper.dart';
//import 'package:getwidget/getwidget.dart';
//
//
//import 'add_prescription_logic.dart';
//
//class EditPrescriptionPage extends StatefulWidget {
//  final int prescriptionId;
//
//  const EditPrescriptionPage({Key? key, required this.prescriptionId}) : super(key: key);
//
//  @override
//  _EditPrescriptionPageState createState() => _EditPrescriptionPageState();
//}
//
//class _EditPrescriptionPageState extends State<EditPrescriptionPage> {
//  late EditPrescriptionLogic _logic;
//
//  @override
//  void initState() {
//    super.initState();
//    _logic = EditPrescriptionLogic(prescriptionId: widget.prescriptionId, context: context);
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Edit Prescription'),
//      ),
//      body: SingleChildScrollView(
//        child: Padding(
//          padding: const EdgeInsets.all(kDefaultPadding),
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.stretch,
//            children: [
//              GfFormField(
//                hintText: 'Patient Name',
//                initialValue: _logic.getPatientName(),
//                onChanged: (value) {
//                  _logic.setPatientName(value);
//                },
//              ),
//              SizedBox(height: kDefaultPadding),
//              CustomTextFormField(
//                labelText: 'Doctor Name',
//                initialValue: _logic.getDoctorName(),
//                onChanged: (value) {
//                  _logic.setDoctorName(value);
//                },
//              ),
//              SizedBox(height: kDefaultPadding),
//              CustomTextFormField(
//                labelText: 'Medication Name',
//                initialValue: _logic.getMedicationName(),
//                onChanged: (value) {
//                  _logic.setMedicationName(value);
//                },
//              ),
//              SizedBox(height: kDefaultPadding),
//              CustomTextFormField(
//                labelText: 'Dosage',
//                initialValue: _logic.getDosage(),
//                onChanged: (value) {
//                  _logic.setDosage(value);
//                },
//              ),
//              SizedBox(height: kDefaultPadding),
//              CustomTextFormField(
//                labelText: 'Route',
//                initialValue: _logic.getRoute(),
//                onChanged: (value) {
//                  _logic.setRoute(value);
//                },
//              ),
//              SizedBox(height: kDefaultPadding),
//              CustomTextFormField(
//                labelText: 'Frequency',
//                initialValue: _logic.getFrequency(),
//                onChanged: (value) {
//                  _logic.setFrequency(value);
//                },
//              ),
//              SizedBox(height: kDefaultPadding),
//              GFButton(
//                onPressed: () async {
//                  await _logic.updatePrescription();
//                  Navigator.pop(context);
//                },
//                text: 'Save Changes',
//              ),
//              SizedBox(height: kDefaultPadding),
//              GFButton(
//                onPressed: () async {
//                  await _logic.deletePrescription();
//                  Navigator.pop(context);
//                },
//                text: 'Delete Prescription',
//                color: GFColors.DANGER,
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}