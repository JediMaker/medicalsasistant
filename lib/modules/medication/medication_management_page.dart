import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'add_medication_page.dart';
import 'package:medicalsasistant/modules/medication/medication_management_page_logic.dart';

class MedicationManagementPage extends StatefulWidget {
  @override
  _MedicationManagementPageState createState() => _MedicationManagementPageState();
}

class _MedicationManagementPageState extends State<MedicationManagementPage> {
  final MedicationManagementPageLogic _logic = MedicationManagementPageLogic();

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    _logic.getMedications();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('药品管理'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _logic.navigateToAddMedicationPage(context),
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
                labelText: '搜索药品',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) async {
                await _logic.searchMedications(value);
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: _logic.medications.isEmpty
                ? Center(
                    child: Text('暂无数据'),
                  )
                : ListView.builder(
                    itemCount: _logic.medications.length,
                    itemBuilder: (_, index) {
                      final medication = _logic.medications[index];

                      return ListTile(
                        title: Text(medication.name??""),
                        subtitle: Text(medication.description??''),
                        trailing: IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () => _logic.navigateToEditMedicationPage(context, medication),
                        ),
                        onLongPress: () => showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('删除药品'),
                            content: Text('确认删除该药品吗？'),
                            actions: [
                              GFButton(
                                child: Text('取消'),
                                onPressed: () => Navigator.pop(context),
                              ),
                              GFButton(
                                child: Text('删除'),
                                onPressed: () async {
                                  await _logic.deleteMedication(medication.id??0);
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
