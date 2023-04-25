import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:medicalsasistant/app_router.dart';
import 'package:medicalsasistant/modules/main/logic.dart';


class HomePage extends StatelessWidget {
  final HomePageLogic logic = HomePageLogic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medical Assistant'),
      ),
      body: ListView(
        children: <Widget>[
          GFCard(
            title: GFListTile(
              title: Text(logic.medicationTitle),
            ),
            content: Text(logic.medicationContent),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.medicationManagementPageRoute);

                  },
                  text: logic.medicationButtonText,
                ),
              ],
            ),
          ),
          GFCard(
            title: GFListTile(
              title: Text(logic.prescriptionTitle),
            ),
            content: Text(logic.prescriptionContent),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.prescriptionManagementPageRoute);
                  },
                  text: logic.prescriptionButtonText,
                ),
              ],
            ),
          ),
          GFCard(
            title: GFListTile(
              title: Text(logic.patientTitle),
            ),
            content: Text(logic.patientContent),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFButton(
                  onPressed: () {
                    Navigator.pushNamed(context, AppRouter.patientManagementPageRoute);
                  },
                  text: logic.patientButtonText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
