import 'package:flutter/material.dart';
import 'package:idukaan/view/util/margins.dart';

class TextFormFieldWidget extends StatelessWidget {
  final IconData prefixIcon;
  final TextInputType keyboardType;
  final String labelText;
  final Function? validator;
  final Function onFieldSubmitted;
  final int? maxLines;
  final bool? obscureText;
  final String? initialValue;
  const TextFormFieldWidget({
    super.key,
    required this.prefixIcon,
    required this.keyboardType,
    required this.labelText,
    required this.onFieldSubmitted,
    this.maxLines,
    this.obscureText,
    this.validator,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: textFieldMargin(context),
      child: TextFormField(
        initialValue: initialValue,
        obscureText: obscureText == null ? false : obscureText!,
        maxLines: maxLines == null ? 1 : maxLines!,
        keyboardType: keyboardType,
        validator: (value) {
          if (validator != null) {
            var check =  validator!(value);
            if (check != null){
              return check;
            }
          }
          if (value!.isEmpty) {
            return '$labelText !';
          } else {
            onFieldSubmitted(value);
            return null;
          }
        },
        onFieldSubmitted: (value) => onFieldSubmitted(value),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon),
          labelText: labelText,
          contentPadding: EdgeInsets.symmetric(
            vertical: MediaQuery.of(context).size.height * 0.01,
          ),
        ),
      ),
    );
  }
}
