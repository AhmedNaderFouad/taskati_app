import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  final String month;
  final String day;
  final String weekDay;
  final bool isActive;
  final VoidCallback? onTap;

  const DateContainer({
    super.key,
    required this.month,
    required this.day,
    required this.weekDay,
    this.isActive = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isActive ? Colors.indigo : Colors.transparent,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              month,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              day,
              style: TextStyle(
                color: isActive ? Colors.white : Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              weekDay,
              style: TextStyle(
                color: isActive ? Colors.white70 : Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
