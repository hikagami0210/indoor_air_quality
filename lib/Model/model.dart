import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../main.dart';

class FireBaseService{

  Future getData()async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final refa = FirebaseDatabase.instance.ref();

    final spProvider = StateProvider<int>((ref) => 0);

    final co2pNow = await StateProvider((ref) => refa.child("date/co2pNow").get());
    final tempNow = await StateProvider((ref) => refa.child("date/tempNow").get());
    final hemiNow = await StateProvider((ref) => refa.child("date/hemiNow").get());
    final HourCo2 = await StateProvider((ref) => refa.child("date/cppm").get());
    final Hourtemp = await StateProvider((ref) => refa.child("date/temp").get());
    final Hourhumi = await StateProvider((ref) => refa.child("date/hemi").get());
    final nowHour = await StateProvider((ref) => refa.child("date/time").get());
    final nowMin = await StateProvider((ref) => refa.child("date/time").get());

    return true;
  }


}