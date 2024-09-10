import 'package:flutter/material.dart';

class TagsWidget extends StatefulWidget {
  const TagsWidget({super.key, required this.tags});
  final String tags;

  @override
  State<TagsWidget> createState() => _TagsWidgetState();
}

class _TagsWidgetState extends State<TagsWidget> {
  List<String> tags = [];

  @override
  void initState() {
    tags = widget.tags.split(',');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        tags.length,
        (i) => _tagWidget(tags[i]),
      ),
    );
  }

  Widget _tagWidget(String tag) {
    return Container(
      padding: const EdgeInsets.all(7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orangeAccent[400],
      ),
      child: Text(
        tag,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey[100],
        ),
      ),
    );
  }
}
