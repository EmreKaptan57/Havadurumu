import 'dart:ui';
import 'package:havadurumu/kayitol.dart';
import 'package:havadurumu/main.dart';
import 'package:flutter/material.dart';
import 'package:havadurumu/menu.dart';
import 'package:havadurumu/sehir.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';
import 'package:google_fonts/google_fonts.dart';

TextEditingController derece = TextEditingController();
TextEditingController ruzgar = TextEditingController();
TextEditingController tarih = TextEditingController();

List<String> giysi1 = ['Seçiniz', 'Tişört', 'Elbise', 'Kazak', 'Gömlek'];
Object? secim1 = 'Seçiniz';
List<String> hava1 = ['Seçiniz', 'Güneşli', 'Bulutlu', 'Yağmurlu', 'Karlı'];
Object? secim = 'Seçiniz';
final List<int> colorCodes = <int>[800, 600, 400];
List<String> ruzgarr = ["21", "26", "43"];
List<String> derecee = ["23", "36", "11"];
List<String> tarihh = ["02.04.2022", "03.04.2022", "04.04.2022"];
List<String> giysii = ["Gömlek", "Tişört", "Tişört"];

class GunKaydet extends StatefulWidget {
  GunKaydet({Key? key}) : super(key: key);

  @override
  State<GunKaydet> createState() => _GunKaydetState();
}

class _GunKaydetState extends State<GunKaydet> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: NewGradientAppBar(
        elevation: 0,
        centerTitle: true,
        title: Text("Günü Kaydet"),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                alignment: Alignment.topCenter,
                height: MediaQuery.of(context).size.height * 0.47,
                width: MediaQuery.of(context).size.width * 0.95,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          size: 40,
                          color: Colors.grey[600],
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.03,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.47,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                              Colors.white,
                            )),
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: Text(
                              "${selectedDate.toLocal()}".split(' ')[0],
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    /*GestureDetector(
                      onTap: () async {
                        setState(() {
                          final now = DateTime.now();
                          time = DateFormat("dd/MM/yyyy").format(now);
                        });
                        myDateTime = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2010),
                          lastDate: DateTime(2030),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        padding: const EdgeInsets.all(19.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: tarih,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                                fontSize: 20,
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                            decoration: InputDecoration(
                                hintText: "Tarih (01/01/22)",
                                icon: Icon(Icons.calendar_month, size: 40),
                                hintStyle: TextStyle(color: Colors.grey[600])),
                          ),
                        ),
                      ),
                    ),*/

                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.all(19.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: derece,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              hintText: "Derece (°C)",
                              icon: Icon(Icons.thermostat, size: 40),
                              hintStyle: TextStyle(color: Colors.grey[600])),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.all(19.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: ruzgar,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold),
                          decoration: InputDecoration(
                              hintText: "Rüzgar (km/h)",
                              icon: Icon(Icons.wind_power, size: 40),
                              hintStyle: TextStyle(color: Colors.grey[600])),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: DropdownButtonFormField(
                            dropdownColor: Colors.white,
                            elevation: 0,
                            value: secim1,
                            items: giysi1
                                .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    alignment: Alignment.center,
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )))
                                .toList(),
                            onChanged: (item) => setState(() => secim1 = item),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.06,
                          child: DropdownButtonFormField(
                            dropdownColor: Colors.white,
                            elevation: 0,
                            value: secim,
                            items: hava1
                                .map((item1) => DropdownMenuItem<String>(
                                    value: item1,
                                    alignment: Alignment.center,
                                    child: Text(
                                      item1,
                                      style: TextStyle(
                                        color: Colors.grey[600],
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )))
                                .toList(),
                            onChanged: (item) => setState(() => secim1 = item),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ));
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 0.06,
                        width: MediaQuery.of(context).size.width * 0.25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.0),
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
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
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
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
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: tarihh.length,
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
                          height: MediaQuery.of(context).size.height * 0.004,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.wind_power,
                              color: Colors.grey,
                            ),
                            Text(
                              ruzgarr[index] + " km/s",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            const Icon(
                              Icons.thermostat,
                              color: Colors.red,
                            ),
                            Text(
                              derecee[index] + "°",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.bold),
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
                              tarihh[index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.emoji_people,
                              color: Colors.black,
                            ),
                            Text(
                              giysii[index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
            ],
          ),
        ),
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
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ));
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
              leading: Icon(Icons.power_settings_new),
              onTap: () {
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
