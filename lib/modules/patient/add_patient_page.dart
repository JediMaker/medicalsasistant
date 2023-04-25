import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'add_patient_logic.dart';
import 'package:medicalsasistant/database//database_helper.dart';

class AddPatientPage extends StatefulWidget {
  final DatabaseHelper? databaseHelper;

  AddPatientPage({ this.databaseHelper});

  @override
  _AddPatientPageState createState() => _AddPatientPageState();
}

class _AddPatientPageState extends State<AddPatientPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _genderController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();

  AddPatientLogic? _logic;
  @override
  Widget build(BuildContext context) {
    _logic =
        AddPatientLogic(databaseHelper: DatabaseHelper(), context: context);
    return Scaffold(
      appBar: GFAppBar(title: Text('Add Patient')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GfFormField(
//                  labelText: 'Name',
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a name';
                    }
                    return null;
                  }, gfFormFieldType: GfFormFieldType.text,
                ),
                SizedBox(height: 16),
                GfFormField(
//                  labelText: 'Age',
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an age';
                    }
                    return null;
                  },gfFormFieldType: GfFormFieldType.text,
                ),
                SizedBox(height: 16),
                GfFormField(
//                  labelText: 'Gender',
                  controller: _genderController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a gender';
                    }
                    return null;
                  },gfFormFieldType: GfFormFieldType.text,
                ),
                SizedBox(height: 16),
                GfFormField(
//                  labelText: 'Phone Number',
                  controller: _phoneNumberController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },gfFormFieldType: GfFormFieldType.text,
                ),
                SizedBox(height: 16),
                GfFormField(
//                  labelText: 'Address',
                  controller: _addressController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter an address';
                    }
                    return null;
                  },gfFormFieldType: GfFormFieldType.text,
                ),
                SizedBox(height: 32),
                GFButton(
                  text: 'Add Patient',
                  onPressed: _onAddPatientPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onAddPatientPressed() async {
    if (_formKey.currentState!.validate()) {
      final patient = await _logic!.addPatient(
        name: _nameController.text,
        age: int.parse(_ageController.text),
        gender: _genderController.text,
        phoneNumber: _phoneNumberController.text,
        address: _addressController.text,
      );

      if (patient != null) {
        Navigator.pop(context);
      }
    }
  }
}
