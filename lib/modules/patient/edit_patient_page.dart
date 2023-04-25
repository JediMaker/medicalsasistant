import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'edit_patient_logic.dart';

class EditPatientPage extends StatefulWidget {
  final int? patientId;

  EditPatientPage({ this.patientId});

  @override
  _EditPatientPageState createState() => _EditPatientPageState();
}

class _EditPatientPageState extends State<EditPatientPage> {
  EditPatientLogic? _logic;

  @override
  void initState() {
    super.initState();
    _logic = EditPatientLogic(context: context, patientId: widget.patientId??0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Edit Patient')),
    body: Form(
    key: _logic!.formKey,
    child: SingleChildScrollView(
    padding: const EdgeInsets.all(16),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
    TextFormField(
    decoration: InputDecoration(labelText: 'Name'),
    initialValue: _logic!.name,
    onSaved: (value) => _logic!.name = value,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter a name';
    }
    return null;
    },
    ),
    SizedBox(height: 16),
    TextFormField(
    decoration: InputDecoration(labelText: 'Age'),
    initialValue: _logic!.age?.toString(),
    onSaved: (value) => _logic!.age = int.tryParse(value!),
    keyboardType: TextInputType.number,
    validator: (value) {
    if (value!.isEmpty) {
    return 'Please enter an age';
    }
    if (int.tryParse(value) == null) {
    return 'Please enter a valid age';
    }
    return null;
    },
    ),
    SizedBox(height: 16),
    TextFormField(
    decoration: InputDecoration(labelText: 'Gender'),
    initialValue: _logic!.gender,
    onSaved: (value) => _logic!.gender = value,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a gender';
        }
        return null;
      },
    ),
    SizedBox(height: 16),
    TextFormField(
      decoration: InputDecoration(labelText: 'Phone Number'),
      initialValue: _logic!.phoneNumber,
      onSaved: (value) => _logic!.phoneNumber = value,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter a phone number';
        }
        return null;
      },
    ),
    SizedBox(height: 16),
    TextFormField(
      decoration: InputDecoration(labelText: 'Address'),
      initialValue: _logic!.address,
      onSaved: (value) => _logic!.address = value,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter an address';
        }
        return null;
      },
    ),
    SizedBox(height: 24),
    GFButton(
      onPressed: _logic!.updatePatient,
      text: 'Save',
    ),
    ],
    ),
    ),
    ),
    );
  }
}
