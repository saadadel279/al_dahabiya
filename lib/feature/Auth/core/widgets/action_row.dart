import 'package:flutter/material.dart';

class ActionRow extends StatelessWidget {
  const ActionRow({
    super.key,
    required this.fText,
    required this.sText,
    this.onTapforAction,
  });
  final String fText;
  final String sText;
  final void Function()? onTapforAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          fText,
          style: const TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 125, 125, 126),
          ),
        ),
        InkWell(
          onTap: onTapforAction,
          child: Text(
            sText,
            style: const TextStyle(
              color: Colors.blue,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
