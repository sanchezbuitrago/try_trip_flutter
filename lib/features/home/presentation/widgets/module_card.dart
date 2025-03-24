// Flutter imports:
import 'package:flutter/material.dart';

class ModuleCard extends StatelessWidget {
  String name;
  IconData icon;
  void Function() onTap;
  ModuleCard(
      {super.key, required this.name, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Redondea las esquinas
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary, // Color del borde
            width: 1, // Grosor del borde
          ),
        ),
        elevation: 10.0,
        shadowColor: Theme.of(context).colorScheme.primary,
        color: Theme.of(context).colorScheme.secondary,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Theme.of(context).colorScheme.primary,
              ),
              Text(
                name,
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              )
            ],
          ),
        ),
      ),
    );
  }
}
