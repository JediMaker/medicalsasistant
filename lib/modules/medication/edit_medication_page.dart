import 'package:flutter/material.dart';
import 'edit_medication_logic.dart';
import 'package:medicalsasistant/models/medication.dart';

class EditMedicationPage extends StatefulWidget {
  final int? medicationId;

  EditMedicationPage({  this.medicationId, Medication? medication});

  @override
  _EditMedicationPageState createState() => _EditMedicationPageState();
}

class _EditMedicationPageState extends State<EditMedicationPage> {
  final _formKey = GlobalKey<FormState>();
  final _medication = Medication();

  @override
  void initState() {
    super.initState();
    _loadMedication();
  }

  void _loadMedication() async {
    final medication =
    await EditMedicationLogic().getMedicationById(widget.medicationId??0);

    setState(() {
      _medication.name = medication!.name;
      _medication.description = medication.description;
      _medication.dosage = medication.dosage;
    });
  }

  void _updateMedication() async {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }

    _formKey.currentState!.save();

    _medication.id = widget.medicationId;

    await EditMedicationLogic().updateMedication(_medication);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Medication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
                initialValue: _medication.name,
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter medication name';
                  }

                  return null;
                },
                onSaved: (value) {
                  _medication.name = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                initialValue: _medication.description,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter medication description';
                  }

                  return null;
                },
                onSaved: (value) {
                  _medication.description = value;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Dosage',
                  border: OutlineInputBorder(),
                ),
                initialValue: _medication.dosage,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter medication dosage';
                  }

                  return null;
                },
                onSaved: (value) {
                  _medication.dosage = value;
                },
              ),
              SizedBox(height: 32.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _updateMedication,
                  child: Text('Update'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
