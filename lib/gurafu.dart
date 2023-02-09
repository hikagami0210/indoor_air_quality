import 'dart:ffi';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';
import 'dart:math';


class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPage();
}

class _NextPage extends State<NextPage> {



  void initState() {
    super.initState();
    Future(() async {
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
        rangeCo2.clear();



        reNowCo2 = co2pNow
            .child("now")
            .value;
        rehemiNow = hemiNow
            .child("now")
            .value;
        retempNow = tempNow
            .child("now")
            .value;
        renowHourCo2 = HourCo2
            .child("${now.hour}")
            .value;

        renowHour = nowHour
            .child("nowHour")
            .value as String?;
        renowMin = nowMin
            .child("nowMin")
            .value as String?;


        if (renowHour?.length == 1) {
          renowHour = "0${renowHour!}";
        }
        if (renowMin?.length == 1) {
          renowMin = "0${renowMin!}";
        }

        for (var i = now.hour; i >= 0; i--) {
          reHourhumi = Hourhumi
              .child("$i")
              .value;
          Last24hoursHumi.add(reHourhumi);
          rangehumi.add(double.parse("$reHourhumi"));

          reHourtemp = Hourtemp
              .child("$i")
              .value;
          Last24hoursTemp.add(reHourtemp);
          rangetemp.add(double.parse("$reHourtemp"));

          reHourco2 = HourCo2
              .child("$i")
              .value;
          Last24hoursCo2.add(reHourco2);
          rangeCo2.add(double.parse("$reHourco2"));

          rehour = HourCo2
              .child("$i")
              .key;
          Last24hours.add(rehour);

          rehour = HourCo2
              .child("$i")
              .key;
          Last24hours.add(rehour);
        }

        for (var i = 23; i > now.hour; i--) {
          reHourtemp = Hourtemp
              .child("$i")
              .value;
          Last24hoursTemp.add(reHourtemp);
          rangetemp.add(double.parse("$reHourtemp"));

          reHourco2 = HourCo2
              .child("$i")
              .value;
          Last24hoursCo2.add(reHourco2);
          rangeCo2.add(double.parse("$reHourco2"));


          reHourhumi = Hourhumi
              .child("$i")
              .value;
          Last24hoursHumi.add(reHourhumi);
          rangehumi.add(double.parse("$reHourhumi"));


          rehour = HourCo2
              .child("$i")
              .key;
          Last24hours.add(rehour);
        }
      }
      );
    }
    );
  }

  List Last24hoursTemp = List.generate(24,(i) => 0);
  List Last24hoursHumi = List.generate(24,(i) => 0);
  List Last24hoursCo2 = List.generate(24,(i) => 0);
  List Last24hours = List.generate(24,(i) => 0);
  List<double> rangeCo2 =  List.generate(24,(i) => 0);
  List<double> rangetemp =  List.generate(24,(i) => 0);
  List<double> rangehumi =  List.generate(24,(i) => 0);

  Object? reNowCo2 = 0;
  Object? retempNow = 0;
  Object? rehemiNow = 0;
  String? renowHour = "00";
  Object? rehour = 00;

  String? renowMin = "00";
  Object? renowHourCo2 = 0;

  Object? renowHourtemp = 0;
  Object? renowHourhumi = 0;
  Object? reHourhumi = 0;
  Object? reHourtemp = 0;
  Object? reHourco2 = 0;



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
      body: SingleChildScrollView(
        child:
          Column(
              children: [
            const SizedBox(
              height: 30,
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(5, 5, 5, 2),
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
                  child: const Text("グラフ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xff3da9fc),
                          fontSize: 60,
                          fontFamily: 'banana')
                  ),
                ),
              ),
            ), //タイトル
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                height: screenSize.height * 0.3,
                width: screenSize.width * 1.3,
                child: LineChart(
                  // 折線グラフ
                  LineChartData(
                    // 折れ線グラフデータ
                    // read about it in the LineChartData section
                      maxX: 23,
                      maxY: rangeCo2.reduce(max)+200,
                      minX: 0,
                      minY: rangeCo2.reduce(min)-200,

                      lineBarsData: [
                        // 線を表示するためのデータ
                        LineChartBarData(
                          // この中に線の色やサイズを書く!
                            isCurved: false,
                            barWidth: 3.0, // 線の幅
                            color: Colors.green[300], // 線の色
                            spots: [
                              FlSpot(0,Last24hoursCo2[0].toDouble()), // 左が横で、右が高さの数値
                              FlSpot(1,Last24hoursCo2[1].toDouble()),
                              FlSpot(2,Last24hoursCo2[2].toDouble()),
                              FlSpot(3,Last24hoursCo2[3].toDouble()),
                              FlSpot(4,Last24hoursCo2[4].toDouble()),
                              FlSpot(5,Last24hoursCo2[5].toDouble()),
                              FlSpot(6,Last24hoursCo2[6].toDouble()),
                              FlSpot(7,Last24hoursCo2[7].toDouble()),
                              FlSpot(8,Last24hoursCo2[8].toDouble()),
                              FlSpot(9,Last24hoursCo2[9].toDouble()),
                              FlSpot(10,Last24hoursCo2[10].toDouble()),
                              FlSpot(11,Last24hoursCo2[11].toDouble()),
                              FlSpot(12,Last24hoursCo2[12].toDouble()),
                              FlSpot(13,Last24hoursCo2[13].toDouble()),
                              FlSpot(14,Last24hoursCo2[14].toDouble()),
                              FlSpot(15,Last24hoursCo2[15].toDouble()),
                              FlSpot(16,Last24hoursCo2[16].toDouble()),
                              FlSpot(17,Last24hoursCo2[17].toDouble()),
                              FlSpot(18,Last24hoursCo2[18].toDouble()),
                              FlSpot(19,Last24hoursCo2[19].toDouble()),
                              FlSpot(20,Last24hoursCo2[20].toDouble()),
                              FlSpot(21,Last24hoursCo2[21].toDouble()),
                              FlSpot(22,Last24hoursCo2[22].toDouble()),
                              FlSpot(23,Last24hoursCo2[23].toDouble()),
                            ])
                      ]),
                  swapAnimationDuration: Duration(milliseconds: 150),
                  swapAnimationCurve: Curves.linear,
                ),
              ),
            ),
            Container(
              height: screenSize.height * 0.3,
              child: LineChart(
                // 折線グラフ
                LineChartData(
                  // 折れ線グラフデータ
                  // read about it in the LineChartData section
                    maxX: 20, // x 軸の最大 x を取得します。null の場合、値は入力 lineBars から読み取られます
                    maxY: 9, // y 軸の最大 y を取得します。null の場合、値は入力 lineBars から読み取られます
                    minX: 0, // x 軸の最小 x を取得します。null の場合、値は入力 lineBars から読み取られます
                    minY: 0, // y 軸の最小 y を取得します。null の場合、値は入力 lineBars から読み取られます

                    lineBarsData: [
                      LineChartBarData(
                          isCurved: false,
                          barWidth: 3.0, // 線の幅
                          color: Colors.green[300], // 線の色
                          spots: [
                            FlSpot(0,Last24hoursCo2[0].toDouble()),






                          ],
                          )
                    ]),
                swapAnimationDuration: Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              ),
            ),
            Container(
              height: screenSize.height * 0.3,
              child: LineChart(
                // 折線グラフ
                LineChartData(
                    maxX: 20,
                    maxY: 9,
                    minX: 0,
                    minY: 0,

                    lineBarsData: [
                      // 線を表示するためのデータ
                      LineChartBarData(
                        // この中に線の色やサイズを書く!
                          isCurved: false,
                          barWidth: 3.0, // 線の幅
                          color: Colors.green[300], // 線の色
                          spots: [
                            FlSpot(0, 5), // 左が横で、右が高さの数値
                            FlSpot(1, 2),
                            FlSpot(2, 8),
                            FlSpot(3, 4),
                            FlSpot(4, 2),
                            FlSpot(5, 6),
                            FlSpot(6, 0),
                            FlSpot(7, 8),
                            FlSpot(8, 5),
                            FlSpot(8, 5),
                            FlSpot(8, 5),
                            FlSpot(8, 5),
                          ])
                    ]),
                swapAnimationDuration: Duration(milliseconds: 150),
                swapAnimationCurve: Curves.linear,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 2, 0, 2),
                  child: SizedBox(
                      height: 45,
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
                              onPressed: () async {
                                showProgressDialog();
                                WidgetsFlutterBinding.ensureInitialized();
                                await Firebase.initializeApp();
                                final ref = FirebaseDatabase.instance.ref();

                                final co2pNow = await ref.child("date/co2pNow")
                                    .get();
                                final tempNow = await ref.child("date/tempNow")
                                    .get();
                                final hemiNow = await ref.child("date/hemiNow")
                                    .get();
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

                                  reNowCo2 = co2pNow
                                      .child("now")
                                      .value;
                                  rehemiNow = hemiNow
                                      .child("now")
                                      .value;
                                  retempNow = tempNow
                                      .child("now")
                                      .value;
                                  renowHourCo2 = HourCo2
                                      .child("${now.hour}")
                                      .value;

                                  renowHour = nowHour
                                      .child("nowHour")
                                      .value as String?;
                                  renowMin = nowMin
                                      .child("nowMin")
                                      .value as String?;


                                  if (renowHour?.length == 1) {
                                    renowHour = "0${renowHour!}";
                                  }
                                  if (renowMin?.length == 1) {
                                    renowMin = "0${renowMin!}";
                                  }

                                  for (var i = now.hour; i >= 0; i--) {
                                    reHourhumi = Hourhumi
                                        .child("$i")
                                        .value;
                                    Last24hoursHumi.add(reHourhumi);
                                  }
                                  for (var i = 23; i > now.hour; i--) {
                                    reHourhumi = Hourhumi
                                        .child("$i")
                                        .value;
                                    Last24hoursHumi.add(reHourhumi);
                                  }

                                  for (var i = now.hour; i >= 0; i--) {
                                    reHourtemp = Hourtemp
                                        .child("$i")
                                        .value;
                                    Last24hoursTemp.add(reHourtemp);
                                  }
                                  for (var i = 23; i > now.hour; i--) {
                                    reHourtemp = Hourtemp
                                        .child("$i")
                                        .value;
                                    Last24hoursTemp.add(reHourtemp);
                                  }

                                  for (var i = now.hour; i >= 0; i--) {
                                    reHourco2 = HourCo2
                                        .child("$i")
                                        .value;
                                    Last24hoursCo2.add(reHourco2);
                                  }
                                  for (var i = 23; i > now.hour; i--) {
                                    reHourco2 = HourCo2
                                        .child("$i")
                                        .value;
                                    Last24hoursCo2.add(reHourco2);
                                  }

                                  for (var i = now.hour; i >= 0; i--) {
                                    rehour = HourCo2
                                        .child("$i")
                                        .key;
                                    Last24hours.add(rehour);
                                  }
                                  for (var i = 23; i > now.hour; i--) {
                                    rehour = HourCo2
                                        .child("$i")
                                        .key;
                                    Last24hours.add(reHourco2);
                                  }
                                }
                                );
                                await Future.delayed(
                                    Duration(seconds: 0.5.toInt()));
                                Navigator.of(context).pop();
                              },
                              child: Stack(children: const [
                                Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "更新",
                                      style: TextStyle(color: Colors.grey,
                                          fontSize: 30,
                                          fontFamily: 'banana'),
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
                      height: 45,
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
                                Navigator.pop(context);
                              },
                              child: Stack(children: const [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "ホーム",
                                      style: TextStyle(color: Colors.grey,
                                          fontSize: 30,
                                          fontFamily: 'banana'),
                                    )),
                              ]),
                            ),
                          ],
                        ),
                      )),
                ),
              ],
            ) //更新ボタン
          ]
          ),

      ),
    );
  }

}