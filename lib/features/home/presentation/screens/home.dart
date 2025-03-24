// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:try_trip/core/services/routes.dart';
import 'package:try_trip/core/widgets/drawer.dart';
import 'package:try_trip/core/widgets/progress_bar.dart';
import 'package:try_trip/features/home/domain/model/state.dart';
import 'package:try_trip/features/home/domain/view_model/session.dart';
import 'package:try_trip/features/home/presentation/widgets/module_card.dart';

class TryTripHomePage extends StatefulWidget {
  const TryTripHomePage({super.key, required this.title});

  final String title;

  @override
  State<TryTripHomePage> createState() => _TryTripHomePageState();
}

class _TryTripHomePageState extends State<TryTripHomePage> {
  HomeState homeState = HomeState();
  SessionViewModel sessionViewModel = SessionViewModel();
  List<ModuleCard> modules = [];

  @override
  void initState() {
    modules = [
      ModuleCard(
          name: "Restaurantes",
          icon: Icons.fastfood_outlined,
          onTap: () {
            AppRoutes.navigateTo(context, AppRoutes.restaurants);
          }),
      ModuleCard(
          name: "Actividades",
          icon: Icons.videogame_asset_sharp,
          onTap: () {
            AppRoutes.navigateTo(context, AppRoutes.activities);
          }),
      ModuleCard(
          name: "Hoteles",
          icon: Icons.hotel,
          onTap: () {
            AppRoutes.navigateTo(context, AppRoutes.hotels);
          }),
    ];
    super.initState();
    validateSession();
  }

  void updateState(HomeState state) {
    setState(() {
      homeState = state;
    });
  }

  void setIsLoading() {
    homeState.isLoading = true;
    setState(() {
      homeState = homeState;
    });
  }

  void goToLogin() {
    AppRoutes.resetTo(context, AppRoutes.login);
  }

  void validateSession() async {
    print("Validando sesion");
    setState(() {
      homeState.isLoading = true;
    });
    bool sessionIsValid = await sessionViewModel.sessionIsValid();
    print("Sesion validada");
    print(sessionIsValid);
    if (!sessionIsValid) {
      goToLogin();
    } else {
      setState(() {
        homeState.isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: DefaultDrawer(),
      body: homeState.isLoading
          ? DefaultProgressIndicator()
          : Column(
              children: [
                Expanded(
                    child: Container(
                  color: Theme.of(context).colorScheme.secondary,
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.3,
                        child: Center(
                            child: Text(
                          "¿ Qué quieres conocer hoy ?",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              crossAxisSpacing: 5,
                              mainAxisSpacing: 5,
                              childAspectRatio: 1.0,
                            ),
                            itemCount: modules
                                .length, // Número de elementos en la grilla
                            itemBuilder: (context, index) {
                              return modules[index];
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ))
              ],
            ),
    );
  }
}
