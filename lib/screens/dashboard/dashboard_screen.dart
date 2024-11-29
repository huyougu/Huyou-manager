import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import '../../constants.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            Center(
              child: TextButton(
                  child: Text("打开文件夹"),
                  onPressed: () async {
                    String? selectedDirectory =
                        await FilePicker.platform.getDirectoryPath();
                    print("result: $selectedDirectory");
                  }),
            )
          ],
        ),
      ),
    );
  }
}
