import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:havadurumu/main.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

List<String> secimSehirHepsi = [
  'Eskisehir',
  'Istanbul',
  'Ankara',
  'Izmir',
  'Antalya',
  'Kars',
  'Sinop'
];
Object? secimCityAlone = 'Eskisehir';
String newCity = secimCityAlone.toString();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kıyava!',
      home: SehirPage(),
    );
  }
}

class SehirPage extends StatefulWidget {
  SehirPage({Key});

  @override
  SehirPageState createState() => SehirPageState();
}

class SehirPageState extends State<SehirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewGradientAppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Şehir Değiştir',
          style: GoogleFonts.dosis(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        gradient: LinearGradient(
          colors: [
            Colors.cyan,
            Colors.indigo,
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
              Colors.cyan,
              Colors.indigo,
            ])),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90.0),
                    gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.white,
                          Colors.white,
                        ])),
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: DropdownButtonFormField(
                          dropdownColor: Colors.white,
                          elevation: 0,
                          value: secimCityAlone,
                          items: secimSehirHepsi
                              .map((item1) => DropdownMenuItem<String>(
                                  value: item1,
                                  alignment: Alignment.center,
                                  child: Text(
                                    item1,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  )))
                              .toList(),
                          onChanged: (item) =>
                              setState(() => secimCityAlone = item),
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                            setState(() {
                              newCity = secimCityAlone.toString();
                            });
                          },
                          child: Text("Değiştir"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
