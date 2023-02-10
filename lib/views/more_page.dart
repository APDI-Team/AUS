import 'package:aus/utils/color_utils.dart';
import 'package:flutter/material.dart';
import 'components/popup_dialog.dart';
import 'terms_and_conditions.dart';

class MorePage extends StatelessWidget {
  const MorePage({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ApdiColors.darkerBackground,
      appBar: AppBar(
        backgroundColor: ApdiColors.darkBackground,
      ),
      body: ListView(
        children: [
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  fullscreenDialog: true,
                  builder: (context) {
                    return const TandCPage();
                  },
                ),
              );
              // Navigator.pushNamed(context, 't&c');
            },
            title: Text("Terms and Conditions"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            onTap: () {
              popUpDialog(context, "Leave Feedback", "Coming Soon!");
            },
            title: Text("Leave us Feedback"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
        ],
      ),
    );
  }
}