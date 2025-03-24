// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:try_trip/core/services/routes.dart';
import 'package:try_trip/features/home/domain/view_model/session.dart';

class DefaultDrawer extends Drawer {
  DefaultDrawer({super.key});
  final SessionViewModel sessionViewModel = SessionViewModel();

  void goTo(BuildContext context, String route) {
    AppRoutes.goBack(context);
    AppRoutes.navigateAndRemoveUntil(context, route, AppRoutes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Column(
          children: [
            Expanded(
                child: ListView(
              // Important: Remove any padding from the ListView.
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary),
                  child: Center(
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/app_icon.png',
                        // Ruta de tu imagen en los activos
                        width: 100, // Ancho de la imagen
                        height: 100, // Alto de la imagen
                        fit: BoxFit
                            .cover, // Ajusta la imagen para que cubra el área del círculo
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('Restaurantes'),
                  onTap: () {
                    goTo(context, AppRoutes.restaurants);
                  },
                ),
                ListTile(
                  title: const Text('Actividades'),
                  onTap: () {
                    goTo(context, AppRoutes.activities);
                  },
                ),
                ListTile(
                  title: const Text('Hoteles'),
                  onTap: () {
                    goTo(context, AppRoutes.hotels);
                  },
                ),
              ],
            )),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Cerrar sesión'),
              onTap: () {
                sessionViewModel.closeSession();
                AppRoutes.resetTo(context, AppRoutes.login);
              },
            ),
          ],
        ),
      ),
    );
  }
}
