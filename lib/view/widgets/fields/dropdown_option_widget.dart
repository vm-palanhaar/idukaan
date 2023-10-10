import 'package:flutter/material.dart';

class DropdownOptionWidget extends StatefulWidget {
  final IconData icon;
  final String labelText;
  late String defaultValue;
  final List<String>? optionList;
  final Function setValue;

  DropdownOptionWidget({
    Key? key,
    required this.icon,
    required this.labelText,
    required this.defaultValue,
    required this.optionList,
    required this.setValue,
  }) : super(key: key);

  @override
  State<DropdownOptionWidget> createState() => _DropdownOptionWidgetState();
}

class _DropdownOptionWidgetState extends State<DropdownOptionWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(widget.icon),
      title: Text(widget.labelText),
      subtitle: DropdownButton<String>(
        value: widget.defaultValue,
        underline: Container(
          height: 2,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        onChanged: (String? newValue) {
          setState(() {
            widget.defaultValue = newValue!;
            widget.setValue(widget.defaultValue);
          });
        },
        items:
        widget.optionList!.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
