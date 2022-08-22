import 'package:havadurumu/auth.dart';
import 'package:havadurumu/main.dart';
import 'package:flutter/material.dart';
import 'package:havadurumu/menu.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController yeniKullanici = TextEditingController();
TextEditingController yeniEposta = TextEditingController();
TextEditingController yeniSifre = TextEditingController();
TextEditingController yeniSifreTekrar = TextEditingController();
AuthService _authService = AuthService();

class KayitOL extends StatefulWidget {
  KayitOL({Key? key}) : super(key: key);

  @override
  State<KayitOL> createState() => _KayitOLState();
}

class _KayitOLState extends State<KayitOL> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NewGradientAppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Kayıt Ol"),
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.50,
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        onChanged: (String idTutucu) {
                          kullaniciAl(yeniKullanici.text);
                        },
                        controller: yeniKullanici,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Kullanıcı Adı',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: yeniEposta,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'E-Posta',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: yeniSifre,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Şifre',
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: const EdgeInsets.all(10),
                      child: TextField(
                        controller: yeniSifreTekrar,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Şifre tekrar',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (yeniKullanici.text.length == 0) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hata!"),
                                  content:
                                      Text("Kullanıcı adı boş bırakılmamalı"),
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
                        } else if (yeniEposta.text.length == 0) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hata!"),
                                  content: Text("E-posta boş bırakılmamalı"),
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
                        } else if (yeniSifre.text.length == 0) {
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
                        } else if (yeniSifreTekrar.text.length == 0) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hata!"),
                                  content: Text(
                                      "Şifre tekrar alanı boş bırakılmamalı"),
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
                        } else if (yeniSifreTekrar.text != yeniSifre.text) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hata!"),
                                  content:
                                      Text("Girmiş olduğunuz şifreler farklı"),
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
                        } else if (yeniSifre.text.length < 6) {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hata!"),
                                  content:
                                      Text("Şifre 6 karakterden fazla olmalı"),
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
                        } else if (_authService.kayit == true) {
                          _authService.CreatePerson(yeniKullanici.text,
                                  yeniEposta.text, yeniSifre.text)
                              .then((value) {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text("Kaydedildi!"),
                                    content: Text(
                                        "Kaydınız başarı ile oluşturuldu!"),
                                    titleTextStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 20),
                                    actionsOverflowButtonSpacing: 20,
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  const GirisMenu(),
                                            ));
                                          },
                                          child: Text("Tamam")),
                                    ],
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                  );
                                });
                          });
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("Hata!"),
                                  content: Text(
                                      "Mevcut e-posta adresi zaten kullanılıyor"),
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
                        child: Text("KAYDET",
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.white,
                        Colors.white,
                      ]),
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void kullaniciAl(String text) {}
}
