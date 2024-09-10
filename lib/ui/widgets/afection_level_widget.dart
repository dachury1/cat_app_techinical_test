import 'package:flutter/material.dart';

class AffectionLevelWidget extends StatelessWidget {
  const AffectionLevelWidget({
    super.key,
    required this.affectionLevel,
  });
  final int affectionLevel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        5,
        (i) => Icon(
          Icons.favorite,
          color: i < affectionLevel ? Colors.red[700] : Colors.grey[400],
        ),
      ),
    );
  }
}