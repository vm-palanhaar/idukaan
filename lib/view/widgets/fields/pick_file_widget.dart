import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class PickFileWidget extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final Function onPressed;

  const PickFileWidget(
      {Key? key,
      required this.icon,
      required this.labelText,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(labelText),
      trailing: const Icon(Icons.upload),
      onTap: () async {
        final resultFile = await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: ['pdf'],
        );
        if (resultFile == null) return;
        onPressed(resultFile.files.first.path);
      },
    );
  }
}
