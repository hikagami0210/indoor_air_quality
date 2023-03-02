import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../main.dart';
import '../others/gurafu.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  void initState(){
    super.initState();

    Future(()async{



      setState(() {







        print(Last24hoursHumi);
        print(Last24hoursTemp);
        print(Last24hours);
      }
      );

    }
    );
  }




  static const IconData sentiment_very_satisfied = IconData(0xe57d, fontFamily: 'MaterialIcons');
  static const IconData sentiment_very_dissatisfied = IconData(0xe57c, fontFamily: 'MaterialIcons');
  static const IconData sentiment_very_dissatisfied_outlined = IconData(0xf35f, fontFamily: 'MaterialIcons');
  static const IconData sentiment_neutral_rounded = IconData(0xf014e, fontFamily: 'MaterialIcons');

  void showProgressDialog() {
    showGeneralDialog(
        context: context,
        barrierDismissible: false,
        transitionDuration: const Duration(milliseconds: 400),
        barrierColor: Colors.black.withOpacity(0.5),
        pageBuilder: (BuildContext context, Animation animation,
            Animation secondaryAnimation) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFFf9f4ef),
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5,5,5,2),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            shadowColor: Colors.black,
            child: Container(
              alignment: Alignment.center,
              height: screenSize.height * 0.11,
              width: screenSize.width * 1,
              child: const Text("Co2モニター",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Color(0xff3da9fc),
                      fontSize: 60,
                      fontFamily: 'banana')),
            ),
          ),
        ),//タイトル
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 15,
            shadowColor: Colors.black,
            child: Container(
              alignment: Alignment.center,
              height: screenSize.height * 0.05,
              width: screenSize.width * 0.95,
              child: Text("表示しているデータは$renowHour:$renowMinのものです",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 20,
                      fontFamily: 'banana')),
            ),
          ),
        ),//時刻
        Padding(
          padding: const EdgeInsets.fromLTRB(5,2,5,2),
          child: SizedBox(
            height: screenSize.height * 0.24,
            width: screenSize.width * 1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 15,
              shadowColor: Colors.black,
              child: Stack(
                children: [
                  // Align(
                  //   alignment: Alignment.center,
                  //   child: Opacity(
                  //     opacity: 0.3,
                  //     child: Image.asset('assets/inui.png'),
                  //   ),
                  // ),
                  const Align(
                    alignment: Alignment(0, -1),
                    child: Text(
                      "",
                      style: TextStyle(fontSize: 116),
                    ),
                  ),
                  Align(
                    alignment: const Alignment(0, -1),
                    child: Text(
                      "$reNowCo2",
                      style: const TextStyle(fontSize: 120),
                    ),
                  ),
                  const Align(
                    alignment: Alignment(0.7, 0.9),
                    child: Opacity(
                      opacity: 0.5,
                      child: Text(
                        "ppm",
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ), //CO2
        ),//co2
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: screenSize.height * 0.12,
                width: screenSize.width * 0.49,
                child:Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  shadowColor: Colors.black,
                  child: Stack(
                    children: [
                      const Align(
                          alignment: Alignment.center,
                          child: Opacity(
                              opacity:0.2,
                              child: Icon(Icons.thermostat,color: Colors.blue,size: 80,))
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: Text("$retempNow",style: const TextStyle(fontSize: 60))
                      ),

                      const Align(
                        alignment: Alignment(1,0.6),
                        child: Opacity(
                          opacity: 0.5,
                          child: Text(
                            "°C",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: screenSize.height * 0.12,
                width: screenSize.width * 0.48,
                child:Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 15,
                  shadowColor: Colors.black,
                  child: Stack(
                    children: [
                      const Align(
                          alignment: Alignment.center,
                          child: Opacity(
                              opacity:0.2,
                              child: FaIcon(FontAwesomeIcons.droplet,color: Colors.blue,size: 80,))
                      ),
                      Align(
                          alignment: Alignment.center,
                          child: Text("$rehemiNow",style: const TextStyle(fontSize: 60))
                      ),
                      const Align(
                        alignment: Alignment(0.7,0.6),
                        child: Opacity(
                          opacity: 0.5,
                          child: Text(
                            "％",
                            style: TextStyle(fontSize: 30),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),//湿度
            ],
          ),
        ),//温湿度
        coState(reNowCo2),//ステータス評価
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
          child: SizedBox(
            height: screenSize.height * 0.15,
            width: screenSize.width * 1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 15,
              shadowColor: Colors.black,
              child: DataTable(
                horizontalMargin: 30,
                dataRowHeight: 30,
                headingRowHeight: 20,
                columnSpacing: 30,
                dividerThickness: 1.2,

                columns: const [
                  DataColumn(
                    label: Text('時刻'),
                  ),
                  DataColumn(
                    label: Text('Co2(ppm)'),
                  ),
                  DataColumn(
                    label: Text('温度(℃)'),
                  ),
                  DataColumn(
                    label: Text('湿度(%)'),
                  ),
                ],
                rows: [
                  DataRow(
                    cells: [
                      DataCell(Text(Last24hours[0].toString()+":00")),
                      DataCell(Text(Last24hoursCo2[0].toString())),
                      DataCell(Text(Last24hoursTemp[0].toString())),
                      DataCell(Text(Last24hoursHumi[0].toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text(Last24hours[1].toString()+":00")),
                      DataCell(Text(Last24hoursCo2[1].toString())),
                      DataCell(Text(Last24hoursTemp[1].toString())),
                      DataCell(Text(Last24hoursHumi[1].toString())),
                    ],
                  ),
                  DataRow(
                    cells: [
                      DataCell(Text(Last24hours[2].toString() + ":00")),
                      DataCell(Text(Last24hoursCo2[2].toString())),
                      DataCell(Text(Last24hoursTemp[2].toString())),
                      DataCell(Text(Last24hoursHumi[2].toString())),
                    ],
                  ),

                ],
              ),
            ),
          ),
        ),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 2,0, 2),
              child: Container(
                  height: 51.4,
                  width: screenSize.width * 0.48,

                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,
                    shadowColor: Colors.black,
                    color: Color(0xFF000000),
                    child: Stack(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Color(0xFFFFFFFF),
                              shadowColor: Colors.black,
                              elevation: 15

                          ),
                          onPressed: () async {
                            showProgressDialog();
                            WidgetsFlutterBinding.ensureInitialized();
                            await Firebase.initializeApp();
                            final ref = FirebaseDatabase.instance.ref();

                            final co2pNow = await ref.child("date/co2pNow").get();
                            final tempNow = await ref.child("date/tempNow").get();
                            final hemiNow = await ref.child("date/hemiNow").get();
                            final HourCo2 = await ref.child("date/cppm").get();
                            final Hourtemp = await ref.child("date/temp").get();
                            final Hourhumi = await ref.child("date/hemi").get();
                            final nowHour = await ref.child("date/time").get();
                            final nowMin = await ref.child("date/time").get();

                            var now = DateTime.now();

                            setState(() {
                              Last24hoursTemp.clear();
                              Last24hoursHumi.clear();
                              Last24hoursCo2.clear();
                              Last24hours.clear();

                              reNowCo2 = co2pNow.child("now").value;
                              rehemiNow = hemiNow.child("now").value;
                              retempNow = tempNow.child("now").value;
                              renowHourCo2 = HourCo2.child("${now.hour}").value;

                              renowHour = nowHour.child("nowHour").value as String?;
                              renowMin  = nowMin.child("nowMin").value as String?;


                              if (renowHour?.length == 1){
                                renowHour = "0${renowHour!}";
                              }
                              if (renowMin?.length == 1){
                                renowMin = "0${renowMin!}";
                              }

                              for(var i = now.hour;i>=0;i--){
                                reHourhumi = Hourhumi.child("$i").value;
                                Last24hoursHumi.add(reHourhumi);
                              }
                              for(var i = 23;i>now.hour;i--){
                                reHourhumi = Hourhumi.child("$i").value;
                                Last24hoursHumi.add(reHourhumi);
                              }

                              for(var i = now.hour;i>=0;i--){
                                reHourtemp = Hourtemp.child("$i").value;
                                Last24hoursTemp.add(reHourtemp);
                              }
                              for(var i = 23;i>now.hour;i--){
                                reHourtemp = Hourtemp.child("$i").value;
                                Last24hoursTemp.add(reHourtemp);
                              }

                              for(var i = now.hour;i>=0;i--){
                                reHourco2 = HourCo2.child("$i").value;
                                Last24hoursCo2.add(reHourco2);
                              }
                              for(var i = 23;i>now.hour;i--){
                                reHourco2 = HourCo2.child("$i").value;
                                Last24hoursCo2.add(reHourco2);
                              }

                              for(var i = now.hour;i>=0;i--){
                                rehour = HourCo2.child("$i").key;
                                Last24hours.add(rehour);
                              }
                              for(var i = 23;i>now.hour;i--){
                                rehour = HourCo2.child("$i").key;
                                Last24hours.add(rehour);
                              }



                              print(Last24hoursHumi);
                              print(Last24hoursTemp);
                              print(Last24hours);
                            }
                            );
                            await Future.delayed(Duration(seconds: 0.5.toInt()));
                            Navigator.of(context).pop();
                          },
                          child: Stack(children: const [
                            Align(
                                alignment: Alignment(0, -0.5),
                                child: Text(
                                  "更新",
                                  style: TextStyle(color: Colors.grey,fontSize: 30,fontFamily: 'banana'),
                                )),
                          ]),
                        ),
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(5, 2, 0, 2),
              child: SizedBox(
                  height: 51.4,
                  width: screenSize.width * 0.48,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 15,
                    shadowColor: Colors.black,
                    child: Stack(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              primary: Colors.white,
                              shadowColor: Colors.black,
                              elevation: 15),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => NextPage(),
                                )
                            );
                          },
                          child: Stack(children: const [
                            Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "グラフ",
                                  style: TextStyle(color: Colors.grey,fontSize: 30,fontFamily: 'banana'),
                                )),
                          ]),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        )//更新ボタン
      ]),
    );
  }

  Widget coState(reNowCo2) {
    var screenSize = MediaQuery.of(context).size;
    if (reNowCo2 <= 200) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        child: SizedBox(
          height: screenSize.height * 0.18,
          width: screenSize.width * 1,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 15,
              shadowColor: Colors.black,
              child: Stack(children: const [
                Align(
                  alignment: Alignment(0.85, -1),
                  child: Opacity(
                    opacity: 0.8,
                    child: Text("Reload？",
                        style: TextStyle(fontFamily: 'banana', fontSize: 50)),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Icon(
                    sentiment_neutral_rounded,
                    size: 110,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment(0.8, 0.6),
                  child: Text("データが無いようです\n更新ボタンを押してみてください"),
                )
              ])),
        ),
      );
    } else if (reNowCo2 <= 1000) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        child: SizedBox(
          height: screenSize.height * 0.18,
          width: screenSize.width * 1,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 15,
              shadowColor: Colors.black,
              child: Stack(children: const [
                Align(
                  alignment: Alignment(0.6, -1.2),
                  child: Opacity(
                    opacity: 0.8,
                    child: Text("Good!",
                        style: TextStyle(fontFamily: 'banana', fontSize: 50)),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Icon(
                    sentiment_very_satisfied,
                    size: 110,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment(0.8, 0.7),
                  child: Text("いい状態です!\n一時間に1､2回ほど換気を行い\nこの状態を保ちましょう！"),
                )
              ])),
        ),
      );
    } else if (reNowCo2 <= 1500) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        child: SizedBox(
          height: screenSize.height * 0.18,
          width: screenSize.width * 1,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 15,
              shadowColor: Colors.black,
              child: Stack(children: const [
                Align(
                  alignment: Alignment(0.75, -1.2),
                  child: Opacity(
                    opacity: 0.8,
                    child: Text("Caution!",
                        style: TextStyle(fontFamily: 'banana', fontSize: 50)),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Icon(
                    sentiment_very_dissatisfied,
                    size: 110,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment(0.7, 0.7),
                  child: Text("少しCo2が多いです...\n窓を開けて換気を行い\n空気を入れ替えましょう！"),
                )
              ])),
        ),
      );
    } else if (reNowCo2 <= 5000) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        child: SizedBox(
          height: screenSize.height * 0.18,
          width: screenSize.width * 1,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 15,
              shadowColor: Colors.black,
              child: Stack(children: const [
                Align(
                  alignment: Alignment(0.75, -1),
                  child: Opacity(
                    opacity: 0.8,
                    child: Text("Badness!",
                        style: TextStyle(fontFamily: 'banana', fontSize: 48)),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Icon(
                    sentiment_very_dissatisfied_outlined,
                    size: 110,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment(0.7, 0.5),
                  child: Text(
                    "Co2が多いです!\n今すぐ換気を行いましょう！",
                    style: TextStyle(fontSize: 15),
                  ),
                )
              ])),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.fromLTRB(5, 2, 5, 2),
        child: SizedBox(
          height: screenSize.height * 0.18,
          width: screenSize.width * 1,
          child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 15,
              shadowColor: Colors.black,
              child: Stack(children: const [
                Align(
                  alignment: Alignment(0.85, -1),
                  child: Opacity(
                    opacity: 0.8,
                    child: Text("Reload？",
                        style: TextStyle(fontFamily: 'banana', fontSize: 50)),
                  ),
                ),
                Align(
                  alignment: Alignment(-0.8, 0),
                  child: Icon(
                    sentiment_neutral_rounded,
                    size: 110,
                    color: Colors.grey,
                  ),
                ),
                Align(
                  alignment: Alignment(0.8, 0.6),
                  child: Text("データが無いようです\n更新ボタンを押してみてください"),
                )
              ])),
        ),
      );
    }
  }
}