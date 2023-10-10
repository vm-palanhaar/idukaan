import 'package:flutter/material.dart';
import 'package:idukaan/view/util/margins.dart';

class AcTextFormFieldWidget extends StatelessWidget {
  final List<String> list;
  final IconData icon;
  final String? id;
  final String? labelText;
  final Function onSelect;

  const AcTextFormFieldWidget({
    Key? key,
    required this.list,
    required this.icon,
    this.id,
    this.labelText,
    required this.onSelect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: textFieldMargin(context),
      child: Autocomplete<String>(
        optionsBuilder: (TextEditingValue textEditingValue) {
          if (textEditingValue.text == '') {
            return const Iterable<String>.empty();
          } else if (textEditingValue.text.toLowerCase().isNotEmpty) {
            return list.where((String option) {
              return option.toLowerCase().contains(textEditingValue.text);
            });
          }
          return list.where((String option) {
            return option.toUpperCase().contains(textEditingValue.text);
          });
        },
        fieldViewBuilder: (context, controller, focusNode, onEditingComplete) {
          return TextFormField(
            controller: controller,
            focusNode: focusNode,
            onEditingComplete: onEditingComplete,
            decoration: InputDecoration(
              prefixIcon: Icon(icon),
              labelText: labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              isDense: true,
              contentPadding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.02,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$labelText !';
              }
              return null;
            },
          );
        },
        onSelected: (String value) => onSelect(value),
      ),
    );
  }
}
