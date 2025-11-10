import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardInformationWidget extends StatelessWidget {
  final String title;
  final String value;
  final Color? color;

  const CardInformationWidget({super.key, required this.title, required this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [Text(title, style: GoogleFonts.aBeeZee(),), Text(value)],
          ),
        ),
      ),
    );
  }
}
