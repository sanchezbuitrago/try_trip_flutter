// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:try_trip/core/widgets/drawer.dart';

class ActivitiesPage extends StatefulWidget {
  const ActivitiesPage({super.key});

  @override
  State<ActivitiesPage> createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          "Actividades",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: DefaultDrawer(),
      body: Column(
        children: [
          Expanded(
              child: Container(
            color: Theme.of(context).colorScheme.secondary,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: Container(
                    child: Center(
                        child: Text(
                      "Planes",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
