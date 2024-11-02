import 'package:flutter/widgets.dart';

import 'semulated_drop_down.dart';

class SimulatedTiteldDropDown extends StatelessWidget {
  const SimulatedTiteldDropDown({
    super.key,
    required this.title,
    required this.hint,
  });
  final String title;
  final String hint;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
          ),
          const SizedBox(width: 50),
          Expanded(
            child: SemulatedDropDown(
              title: hint,
            ),
          ),
        ],
      ),
    );
  }
}
