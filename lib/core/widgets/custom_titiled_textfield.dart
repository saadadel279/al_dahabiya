import 'package:flutter/material.dart';

class CustomTitledTextField extends StatelessWidget {
  const CustomTitledTextField({
    super.key,
    required this.title,
    required this.hint,
    this.sufix,
    this.prefix,
    this.controller,
    this.validator,
  });
  final String title;
  final String hint;
  final Widget? sufix;
  final Widget? prefix;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(
              color: Color.fromARGB(255, 172, 170, 170),
              fontSize: 16,
            )),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            disabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.green),
            ),
            suffixIcon: sufix,
            prefixIcon: prefix,
            hintText: hint,
            hintStyle:
                const TextStyle(color: Color.fromARGB(255, 172, 170, 170)),
          ),
        )
      ],
    );
  }
}
