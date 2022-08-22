import 'package:havadurumu/auth.dart';
import 'package:havadurumu/kayitol.dart';
import 'package:havadurumu/main.dart';
import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

final TextEditingController mevcutEposta = TextEditingController();
final TextEditingController mevcutSifre = TextEditingController();

AuthService _authService = AuthService();

class GirisMenu extends StatelessWidget {
  const GirisMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NewGradientAppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Oturum Aç"),
        gradient: LinearGradient(
          colors: [
            Colors.cyan,
            Colors.indigo,
          ],
        ),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                Colors.cyan,
                Colors.indigo,
              ])),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.001,
                  ),
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    // width: MediaQuery.of(context).size.width * 0.8,
                    // height: MediaQuery.of(context).size.height * 0.6,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.white,
                              Colors.white,
                            ])),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const MyHomePage()));
                          },
                          child: Icon(
                            Icons.sunny,
                            size: 70,
                            color: Colors.yellow[700],
                          ),
                        ),
                        Text(
                          "HAVA DURUMU",
                          style: GoogleFonts.acme(
                              fontSize: 40,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.008,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: const EdgeInsets.all(5.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: TextField(
                              controller: mevcutEposta,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'E-Posta',
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.001,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: TextField(
                            controller: mevcutSifre,
                            obscureText: true,
                            keyboardType: TextInputType.visiblePassword,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Şifre',
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (mevcutEposta.text.length == 0) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Hata!"),
                                      content:
                                          Text("E-posta boş bırakılmamalı"),
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      actionsOverflowButtonSpacing: 20,
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Tekrar Dene")),
                                      ],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    );
                                  });
                            } else if (mevcutSifre.text.length == 0) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Hata!"),
                                      content:
                                          Text("Şifre alanı boş bırakılmamalı"),
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      actionsOverflowButtonSpacing: 20,
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Tekrar Dene")),
                                      ],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    );
                                  });
                            } else if (!mevcutEposta.text.contains('@')) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Hata!"),
                                      content: Text("E-posta hatalı"),
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      actionsOverflowButtonSpacing: 20,
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Tekrar Dene")),
                                      ],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    );
                                  });
                            } else if (mevcutSifre.text.length < 6) {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Hata!"),
                                      content: Text(
                                          "Şifre 6 karakterden fazla olmalı"),
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      actionsOverflowButtonSpacing: 20,
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Tekrar Dene")),
                                      ],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    );
                                  });
                            } else if (_authService.giris == true) {
                              _authService.SignIn(
                                  mevcutEposta.text, mevcutSifre.text);

                              if (_authService.id != null &&
                                  _authService.giris == true) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const MyHomePage()));
                              }
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Hata!"),
                                      content: Text("Şifre hatalı"),
                                      titleTextStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          fontSize: 20),
                                      actionsOverflowButtonSpacing: 20,
                                      actions: [
                                        ElevatedButton(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            child: Text("Tekrar Dene")),
                                      ],
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20))),
                                    );
                                  });
                            }
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      Colors.cyan,
                                      Colors.indigo,
                                    ])),
                            child: Text("Oturum Aç",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => KayitOL(),
                            ));
                          },
                          child: Container(
                            alignment: Alignment.center,
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width * 0.25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(
                                    begin: Alignment.centerRight,
                                    end: Alignment.centerLeft,
                                    colors: [
                                      Colors.cyan,
                                      Colors.indigo,
                                    ])),
                            child: Text("Kayıt Ol",
                                style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
