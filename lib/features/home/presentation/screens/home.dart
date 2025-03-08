import 'package:flutter/material.dart';
import 'package:try_trip/core/services/routes.dart';
import 'package:try_trip/core/widgets/drawer.dart';
import 'package:try_trip/core/widgets/buttons.dart';
import 'package:try_trip/features/home/domain/view_model/session.dart';
import 'package:try_trip/features/home/domain/model/state.dart';

class TryTripHomePage extends StatefulWidget {
  const TryTripHomePage({super.key, required this.title});

  final String title;

  @override
  State<TryTripHomePage> createState() => _TryTripHomePageState();
}

class _TryTripHomePageState extends State<TryTripHomePage> {
  HomeState homeState = HomeState();
  int _counter = 0;
  String message = 'You have pushed the button this many times:';
  SessionViewModel sessionViewModel = SessionViewModel();

  @override
  void initState() {
    super.initState();
    validateSession();
  }

  void updateState(HomeState state){
    setState(() {
      homeState = state;
    });
  }

  void setIsLoading(){
    homeState.isLoading = true;
    setState(() {
      homeState = homeState;
    });
  }

  void goToUserRegister(){
    AppRoutes.resetTo(context, AppRoutes.userRegister);
  }

  void validateSession() async {
    print("__________________________________________-");
    bool sessionIsValid = await sessionViewModel.sessionIsValid();
    if (!sessionIsValid){
      goToUserRegister();
    }
    setState(() {
      homeState.isLoading = false;
      if (sessionIsValid){
        message = "La session es valida";
      }else{
        message = "Se debe retornar a la pantalla de inicio";
      }
    });

  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      drawer: const DefaultDrawer(),
      body: Container(
        color: Theme.of(context).colorScheme.secondary,
        child: Center(
          child: homeState.isLoading ? CircularProgressIndicator() : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(message,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
              Text('$_counter',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary)),
            ],
          ),
        ),
      ),
      bottomNavigationBar: DefaultButtonNavigationBar(
          onPressed: _incrementCounter,
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary)
      )
    );
  }
}
