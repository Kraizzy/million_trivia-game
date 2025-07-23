import 'package:flutter/material.dart';

class LifelineButton extends StatelessWidget {
  final IconData icon;
  final bool used;
  final VoidCallback onTap;

  const LifelineButton({
    super.key,
    required this.icon,
    required this.used,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: used ? null : onTap,
      child: Opacity(
        opacity: used ? 0.4 : 1,
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Colors.black45,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Icon(icon, color: Colors.white, size: 28),
        ),
      ),
    );
  }
}
