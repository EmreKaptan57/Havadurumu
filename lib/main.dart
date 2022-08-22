import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:havadurumu/data_service.dart';
import 'package:havadurumu/gunkaydet.dart';
import 'package:havadurumu/menu.dart';
import 'package:havadurumu/sehir.dart';
import 'package:havadurumu/weather_model.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hava Durumu',
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
  Future<void> getData() async {
    model = await service.getWeather("Eskisehir");
    temp = model!.main!.temp;
    print(temp);
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
  List<String> giysi1 = ['Tişört', 'Elbise', 'Kazak', 'Gömlek'];
  Object? secim1 = 'Tişört';
  List<String> giysi2 = ['Tişört', 'Elbise', 'Kazak', 'Gömlek'];
  Object? secim2 = 'Tişört';
  List<String> giysi3 = ['Tişört', 'Elbise', 'Kazak', 'Gömlek'];
  Object? secim3 = 'Tişört';
  String anlikDerece = "29";
  String sehir = "Eskisehir";
  Color renk1 = Colors.white;
  Color renk2 = Colors.orange;

  void boss() {
    setState(() {
      ListTile(
        title: const Text('Hesap Değiştir'),
        leading: Icon(Icons.person_search),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const GirisMenu(),
          ));
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NewGradientAppBar(
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //     Navigator.of(context).push(MaterialPageRoute(
        //       builder: (context) => const MenuPage(),
        //     )
        //     );
        //   },
        //   color: Colors.white,
        //   icon: Icon(Icons.menu),
        // ),
        centerTitle: true,
        title: Text('Hava Durumu'),
        gradient: LinearGradient(
          colors: [Colors.orange, Colors.red],
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
                      colors: [Colors.orange, Colors.red])),
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
                            ? (temp! <= 30)
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
                      Row(
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
                            colors: [renk1, Colors.orange],
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
                                Text("Günün Önerisi : $secim1",
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
                              "Merhaba , $sehir'de Hava ${temp}° dereceyi gösteriyor. Bugün ki hava değerlerine en yakın günü ${tarih[0]} tarihinde, ${giysi1[0]} giyerek değerlendirmişsin. Geçmiş tercihlerine ve hava tahminlerine bakarsak, bugün de $secim1 giymeni önerebilirim.",
                              style: GoogleFonts.dosis(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),

                      /*SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),
                    Expanded(
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: tarih.length,
                        separatorBuilder: (BuildContext context, int index) =>
                            const Padding(padding: EdgeInsets.all(0)),
                        itemBuilder: (context, index) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.white,
                          ),
                          height: 120,
                          width: 150,
                          child: Column(
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.yellow[colorCodes[index]],
                                ),
                                height: 100,
                                width: 120,
                                child: Icon(
                                  Icons.sunny,
                                  color: Colors.white,
                                  size: 80,
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.004,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.wind_power,
                                    color: Colors.grey,
                                  ),
                                  Text(
                                    ruzgar[index] + " km/s",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const Icon(
                                    Icons.thermostat,
                                    color: Colors.red,
                                  ),
                                  Text(
                                    derece[index] + "°",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.calendar_month,
                                    color: Colors.brown[600],
                                  ),
                                  Text(
                                    tarih[index],
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.22,
                                height: MediaQuery.of(context).size.height * 0.05,
                                child: DropdownButtonFormField(
                                  elevation: 0,
                                  value: secim1,
                                  items: giysi1
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item, child: Text(item)))
                                      .toList(),
                                  onChanged: (item) =>
                                      setState(() => secim1 = item),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.06,
                    ),*/
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
                "Emre Kaptan",
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
                "emrekaptan@piton.com.tr",
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
                  child: Image.network(
                    "https://yt3.ggpht.com/9y_H2GuDbYFxNUXkkPrBB0V7OH40Sz7kyV_oT9la9idIJbi_Mz9XCWk90-Gphj5zdFAU15h5qw=s176-c-k-c0x00ffffff-no-rj-mo",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(
                    "https://www.formsante.com.tr/wp-content/uploads/2020/12/wsi-imageoptim-iStock-485289973-e1602246810898-1200x675.jpg"),
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => GunKaydet(),
                ));
              },
            ),
            ListTile(
              title: const Text('Çıkış Yap'),
              leading: Icon(Icons.exit_to_app),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GirisMenu(),
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
