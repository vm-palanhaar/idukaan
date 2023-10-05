import 'package:flutter/material.dart';

class SwitchWidget extends StatefulWidget {
  final IconData icon;
  final String text;
  final bool defaultValue;
  final Function onChanged;

  const SwitchWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.defaultValue,
    required this.onChanged,
  });

  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {
  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      value: widget.defaultValue,
      onChanged: (bool? value) {
        widget.onChanged(value!);
      },
      title: Text(widget.text),
      secondary: Icon(widget.icon),
    );
  }
}
