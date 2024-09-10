import 'package:flutter/material.dart';

class IntelligenceWidget extends StatelessWidget {
  const IntelligenceWidget({
    super.key,
    required this.intelligence,
  });
  final int intelligence;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (i) => Icon(
          Icons.lightbulb,
          color: i < intelligence ? Colors.yellow[700] : Colors.grey[400],
        ),
      ),
    );
  }
}