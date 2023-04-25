import 'package:flutter/material.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:medicalsasistant/models/medication.dart';
import 'package:medicalsasistant/models/patient.dart';
import 'package:medicalsasistant/models/prescription.dart';
import 'package:medicalsasistant/database//database_helper.dart';
import 'package:getwidget/getwidget.dart';


import 'add_prescription_logic.dart';

class AddPrescriptionPage extends StatefulWidget {
  final Patient ?patient;
  final List<Medication>? medications;

  AddPrescriptionPage({Key? key,  this.patient,  this.medications}) : super(key: key);

  @override
  _AddPrescriptionPageState createState() => _AddPrescriptionPageState();
}

class _AddPrescriptionPageState extends State<AddPrescriptionPage> {
  final _formKey = GlobalKey<FormState>();
  final _logic = AddPrescriptionLogic(databaseHelper: DatabaseHelper.instance);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Prescription'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
//                  hintText: 'Medication',
                  decoration: InputDecoration(
                    labelText: 'Medication',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _logic.medicationName,
                  onChanged: (value) => _logic.medicationName = value,
//                  gfFormFieldType: GfFormFieldType.text,
//                  iconPrefix: Icon(Icons.local_pharmacy),
                  style: TextStyle(color: Colors.grey[800]),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a medication name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
//                  hintText: 'Dosage',
                  decoration: InputDecoration(
                    labelText: 'Dosage',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _logic.dosage,
                  onChanged: (value) => _logic.dosage = value,
//                  gfFormFieldType: GfFormFieldType.text,
//                  iconPrefix: Icon(Icons.edit),
                  style: TextStyle(color: Colors.grey[800]),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a dosage';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                TextFormField(
//                  hintText: 'Instructions',
                  decoration: InputDecoration(
                    labelText: 'Instructions',
                    border: OutlineInputBorder(),
                  ),
                  initialValue: _logic.instructions,
                  onChanged: (value) => _logic.instructions = value,
//                  gfFormFieldType: GfFormFieldType.text,
//                  iconPrefix: Icon(Icons.notes),
                  style: TextStyle(color: Colors.grey[800]),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter instructions';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 24),
                GFButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();

                      Prescription prescription = Prescription(
                        id: null,
//                        patientId: widget.patient!.id??0,
                        medicationName: _logic.medicationName,
                        dosage: _logic.dosage,
                        instructions: _logic.instructions,
//                        date: DateTime.now(),
                      );

                      _logic.addPrescription(prescription);

                      Navigator.pop(context);
                    }
                  },
                  text: 'Save',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
