import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:havadurumu/data_service.dart';
import 'package:havadurumu/gunkaydet.dart';
import 'package:havadurumu/kayitol.dart';
import 'package:havadurumu/menu.dart';
import 'package:havadurumu/sehir.dart';
import 'package:havadurumu/weather_model.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 1))
        .then((value) => {FlutterNativeSplash.remove()});
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kıyava!',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: GirisMenu(),
      routes: <String, WidgetBuilder>{},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  WeatherModel? model;
  double? temp;
  int? kiyava;
  Future<void> getData() async {
    model =
        await service.getWeather("$newCity"); //burdan şehri değiştirebilirsin.
    temp = model!.main!.temp;
    int kiyava = temp!.toInt();
    print(temp);
    print(kiyava);
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  DataService service = DataService();
  final List<int> colorCodes = <int>[800, 600, 400];
  List<String> ruzgar = ["21", "26", "43"];
  List<String> derece = ["23", "36", "11"];
  List<String> tarih = ["02.04.2022", "03.04.2022", "04.04.2022"];
  List<String> hava1 = ['Seçiniz', 'Güneşli', 'Bulutlu', 'Yağmurlu', 'Karlı'];
  Object? secim = 'Seçiniz';
  List<String> giysi1 = ['Tişört', 'Elbise', 'Kazak', 'Mont'];
  Object? secim1 = 'Tişört';
  List<String> giysi2 = ['Tişört', 'Elbise', 'Kazak', 'Mont'];
  Object? secim2 = 'Kazak';
  List<String> giysi3 = ['Tişört', 'Elbise', 'Kazak', 'Mont'];
  Object? secim3 = 'Mont';
  String sehir = newCity.toString();
  Color renk1 = Colors.white;
  Color renk2 = Colors.orange;

  void boss() {
    setState(() {
      ListTile(
        title: const Text('Hesap Değiştir'),
        leading: Icon(Icons.person_search),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => GirisMenu(),
          ));
        },
      );
    });
  }

  final Uri url = Uri.parse(
      'https://play.google.com/store/apps/dev?id=6025433514217852795');

  Future<void> launchUrlWeb() async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NewGradientAppBar(
        elevation: 0,
        centerTitle: true,
        title: Text(
          'KIYAVA',
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
      body: FutureBuilder(
        future: getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Center(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Colors.cyan,
                    Colors.indigo,
                  ])),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Icon(
                        temp != null
                            ? (temp! <= 12)
                                ? Icons.cloud
                                : Icons.sunny
                            : Icons.cloudy_snowing,
                        size: 100,
                        color: Colors.white,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.thermostat,
                            size: 70,
                            color: Colors.white,
                          ),
                          Text(
                            "${temp}°",
                            style: GoogleFonts.dosis(
                                fontSize: 90,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SehirPage(),
                          ));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on,
                              size: 30,
                              color: Colors.white,
                            ),
                            Text(
                              "$sehir",
                              style: GoogleFonts.dosis(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        alignment: Alignment.topCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40),
                            topLeft: Radius.circular(40),
                          ),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [renk1, Colors.blue],
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.60,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.emoji_people,
                                  color: Colors.black,
                                  size: 25,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                    temp != null
                                        ? (temp! <= 12)
                                            ? "Günün Önerisi : " "$secim3"
                                            : "Günün Önerisi : " "$secim1"
                                        : "Günün Önerisi : " "$secim2",
                                    style: GoogleFonts.dosis(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text(
                              temp != null
                                  ? (temp! <= 12)
                                      ? "Merhaba, $sehir'de Hava ${temp}° dereceyi gösteriyor. Geçmiş tercihlerine ve hava tahminlerine bakarsak, bugün de $secim3 giymeni önerebilirim."
                                      : "Merhaba, $sehir'de Hava ${temp}° dereceyi gösteriyor. Geçmiş tercihlerine ve hava tahminlerine bakarsak, bugün de $secim1 giymeni önerebilirim."
                                  : "Merhaba, $sehir'de Hava ${temp}° dereceyi gösteriyor. Geçmiş tercihlerine ve hava tahminlerine bakarsak, bugün de $secim2 giymeni önerebilirim.",
                              style: GoogleFonts.dosis(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text(
                "Hoşgeldin!",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 1.0,
                        color: Colors.black),
                  ],
                ),
              ),
              accountEmail: const Text(
                "misafir",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                        offset: Offset(1, 1),
                        blurRadius: 1.0,
                        color: Colors.black),
                  ],
                ),
              ),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            'assets/images/kiyavaLogo.png'), // Background Image
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    "https://spaceplace.nasa.gov/blue-sky/en/bluesky.en.png"),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              title: const Text('Hava Durumu'),
              leading: Icon(Icons.cloud),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Şehir Değiştir'),
              leading: Icon(Icons.location_city),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SehirPage(),
                ));
              },
            ),
            ListTile(
              title: const Text('Günü Kaydet'),
              leading: Icon(Icons.save),
              onTap: () {
                /*
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GunKaydet(),
                ));*/
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Kıyava"),
                        content: Text("Yakında..."),
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
                              child: Text("Tamam")),
                        ],
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      );
                    });
              },
            ),
            ListTile(
              title: const Text('Bizi Puanla'),
              leading: Icon(Icons.star_rate_rounded),
              onTap: () {
                launchUrlWeb();
              },
            ),
            ListTile(
              title: const Text('Çıkış Yap'),
              leading: Icon(Icons.exit_to_app),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GirisMenu(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
