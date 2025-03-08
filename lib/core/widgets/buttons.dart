import 'package:flutter/material.dart';

class DefaultButtonNavigationBar extends StatelessWidget {

  void Function() onPressed;
  Widget? child;
  DefaultButtonNavigationBar({super.key, required this.onPressed, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(
                Theme.of(context).colorScheme.primary),
            foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onPrimary),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          ),
          onPressed: onPressed,
          child: child,
        ),
      ),
    );
  }
}