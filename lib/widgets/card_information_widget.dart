import 'package:flutter/material.dart';

class CardInformationWidget extends StatelessWidget {
  final String title;
  final String value;

  const CardInformationWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(title), Text(value)],
          ),
        ),
      ),
    );
  }
}
