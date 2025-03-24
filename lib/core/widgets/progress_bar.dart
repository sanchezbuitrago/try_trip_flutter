// Flutter imports:
import 'package:flutter/material.dart';

class DefaultProgressIndicator extends StatelessWidget {
  const DefaultProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Container(
          color: Theme.of(context).colorScheme.secondary,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ))
      ],
    );
  }
}
