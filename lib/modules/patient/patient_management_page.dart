import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:medicalsasistant/models/patient.dart';
import 'add_patient_page.dart';

import 'patient_management_page_logic.dart';

class PatientManagementPage extends StatefulWidget {
  @override
  _PatientManagementPageState createState() => _PatientManagementPageState();
}

class _PatientManagementPageState extends State<PatientManagementPage> {
  final PatientManagementPageLogic _logic = PatientManagementPageLogic();

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _logic.getPatients();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('病人管理'),
        actions:
                [
                IconButton(
                        icon: Icon(Icons.add),
            onPressed: () => _logic.navigateToAddPatientPage(context),
          ),
        ],
      ),
    body: Column(
            children: [
    Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
            labelText: '搜索病人',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.search),
              ),
    onChanged: (value) async {
      await _logic.searchPatients(value);
      setState(() {});
    },
            ),
          ),
    Expanded(
            child: _logic.patients.isEmpty
            ? Center(
            child: Text('暂无数据'),
                  )
                : ListView.builder(
            itemCount: _logic.patients.length,
            itemBuilder: (_, index) {
      final patient = _logic.patients[index];

      return ListTile(
              title: Text(patient.name??""),
              subtitle: Text(patient.gender??"" + ' / ' + patient.age.toString()),
              trailing: IconButton(
              icon: Icon(Icons.edit),
              onPressed: () => _logic.navigateToEditPatientPage(context, patient),
                        ),
      onLongPress: () => showDialog(
              context: context,
              builder: (_) => AlertDialog(
              title: Text('删除病人'),
              content: Text('确认删除该病人吗？'),
              actions: [
      GFButton(
              child: Text('取消'),
              onPressed: () => Navigator.pop(context),
                              ),
      GFButton(
              child: Text('删除'),
              onPressed: () async {
        await _logic.deletePatient(patient.id??0);
        Navigator.pop(context);
      },
                              ),
                            ],
                          ),
                        ),
                      );
    },
                  ),
          ),
        ],
      ),
    );
  }
}
