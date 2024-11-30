import 'package:flutter/material.dart';
import 'package:process_run/process_run.dart';
import '../../constants.dart';
import '../dashboard/components/file_info_card.dart';
import 'package:admin/models/my_files.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class EditorOption {
  final String name;
  final String path;

  EditorOption(this.name, this.path);
}

List<EditorOption> editorOptions = [
  EditorOption('Visual Studio Code', '/Users/pjh/Visual Studio Code.app'),
  EditorOption('Android Studio', '/Users/pjh/Android Studio.app'),
  EditorOption('Xcode', '/Applications/Xcode.app'),
];

class _DashboardScreenState extends State<DashboardScreen> {
  String EditerPath = "/Users/pjh/Visual Studio Code.app";
  String EchoPath = "Users/pjh/echo";
  EditorOption _selectedEditorOption = editorOptions.first;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "编辑器  ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
                DropdownButton<EditorOption>(
                    value: _selectedEditorOption,
                    items: editorOptions.map((EditorOption option) {
                      return DropdownMenuItem<EditorOption>(
                        value: option,
                        child: Text(option.name),
                      );
                    }).toList(),
                    onChanged: (EditorOption? newValue) {
                      if (newValue != null) {
                        setState(() {
                          _selectedEditorOption = newValue;
                          EditerPath = newValue.path;
                        });
                      }
                    })
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Wrap(
              alignment: WrapAlignment.start,
              children: [
                Container(
                    width: 400,
                    height: 150,
                    child: GestureDetector(
                      onTap: () async {
                        // String? selectedDirectory =
                        //     await FilePicker.platform.getDirectoryPath();
                        // if (selectedDirectory == null) return;
                        // List arr = selectedDirectory.split("/");
                        // //丢弃前三个元素
                        // arr = arr.sublist(3);
                        // String path = arr.join("/");
                        // String cmd = 'open -a "${EditerPath}" "/$EchoPath"';
                        // print(cmd);
                        String cmd = 'open -a "${EditerPath}" "/$EchoPath"';

                        await run(cmd,
                            workingDirectory: "/Users/pjh", runInShell: true);
                      },
                      behavior: HitTestBehavior.opaque,
                      child: Container(
                        child: FileInfoCard(
                          info: CloudStorageInfo(
                            title: "打开echo",
                            numOfFiles: 1328,
                            svgSrc: "assets/icons/Documents.svg",
                            totalStorage: "1.9GB",
                            color: primaryColor,
                            percentage: 35,
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 20,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
