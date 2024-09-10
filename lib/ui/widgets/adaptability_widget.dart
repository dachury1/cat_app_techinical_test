import 'package:flutter/material.dart';

class AdptabilityWidget extends StatelessWidget {
  const AdptabilityWidget({
    super.key,
    required this.adaptability,
  });
  final int adaptability;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (i) => Icon(
          Icons.star,
          color: i < adaptability ? Colors.yellow[700] : Colors.grey[400],
        ),
      ),
    );
  }
}