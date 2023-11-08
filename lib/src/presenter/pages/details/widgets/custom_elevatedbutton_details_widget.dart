import 'package:flutter/material.dart';

class CustomElevatedbuttonDetailsWidgetarrowback extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final IconData icon;
  const CustomElevatedbuttonDetailsWidgetarrowback({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 20,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 30)),
      onPressed: onTap,
      child: Row(
        children: [
          Icon(icon),
          Text(title),
        ],
      ),
    );
  }
}

class CustomElevatedbuttonDetailsWidgetarrowbackRight extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final IconData icon;
  const CustomElevatedbuttonDetailsWidgetarrowbackRight({
    super.key,
    required this.title,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 20,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 30)),
      onPressed: onTap,
      child: Row(
        children: [
          Text(title),
          Icon(icon),
        ],
      ),
    );
  }
}
