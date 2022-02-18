import 'package:flutter/material.dart';

class CustomTab extends StatelessWidget {
  const CustomTab({
    Key? key,
    required this.label,
    required this.backgroundColor,
  }) : super(key: key);
  final String label;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 120,
      height: 50,
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 7,
          )
        ],
      ),
    );
  }
}
