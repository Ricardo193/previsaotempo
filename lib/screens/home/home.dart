import 'package:flutter/material.dart';
import 'package:previsaotempo/provider/weather_service.dart';
import 'package:previsaotempo/screens/home/widgets/main_screen.dart';

class Home extends StatefulWidget {
  @override
  createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getData(),
        builder: (BuildContext _, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
              );
            default:
              return MainScreen(data: snapshot.data["results"]);
          }
        });
  }
}
