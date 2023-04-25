import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'prescription_management_page_logic.dart';
import 'package:medicalsasistant/models/prescription.dart';
import 'add_prescription_page.dart';

class PrescriptionManagementPage extends StatefulWidget {
  @override
  _PrescriptionManagementPageState createState() => _PrescriptionManagementPageState();
}

class _PrescriptionManagementPageState extends State<PrescriptionManagementPage> {
  final PrescriptionManagementPageLogic _logic = PrescriptionManagementPageLogic();

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _logic.getPrescriptions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('处方管理'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _logic.navigateToAddPrescriptionPage(context),
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
          labelText: '搜索处方',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) async {
          await _logic.searchPrescriptions(value);
          setState(() {});
        },
      ),
    ),
    Expanded(
    child: _logic.prescriptions.isEmpty
    ? Center(
    child: Text('暂无数据'),
    )
        : ListView.builder(
    itemCount: _logic.prescriptions.length,
    itemBuilder: (_, index) {
    final Prescription prescription = _logic.prescriptions[index];

    return ListTile(
    title: Text(prescription
        .medicationName! +
        ' / ' +
        prescription.dosage! +
        ' / ' +
        prescription.instructions!),
//      subtitle: Text(prescription.medications.map((medication) => medication.name).join(', ')),
      trailing: IconButton(
        icon: Icon(Icons.edit),
        onPressed: () => _logic.navigateToEditPrescriptionPage(context, prescription),
      ),
      onLongPress: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('删除处方'),
          content: Text('确认删除该处方吗？'),
          actions: [
            GFButton(
              child: Text('取消'),
              onPressed: () => Navigator.pop(context),
            ),
            GFButton(
              child: Text('删除'),
              onPressed: () async {
                await _logic.deletePrescription(prescription.id??0);
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
