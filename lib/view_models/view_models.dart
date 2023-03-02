


import '../main.dart';

class viewModels{
  Future viewMoldel()async{

    var now = DateTime.now();

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

  }
}