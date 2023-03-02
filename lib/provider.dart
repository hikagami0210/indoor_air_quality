import 'package:flutter_riverpod/flutter_riverpod.dart';

final Last24hoursTempP = StateProvider<List>((ref) => [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
final Last24hoursHumiP = StateProvider<List>((ref) => [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
final Last24hoursCo2P = StateProvider<List>((ref) => [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);
final Last24hoursP = StateProvider<List>((ref) => [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]);

final reNowCo2P = StateProvider((ref) => 0);
final retempNowP = StateProvider((ref) => 0);
final rehemiNowP = StateProvider((ref) => 0);
final renowHourP = StateProvider((ref) => "00");
final renowMinP = StateProvider((ref) => "00");
final rehourP = StateProvider((ref) => 0);
final renowHourCo2P = StateProvider((ref) => 0);

final renowHourtempP = StateProvider((ref) => 0);
final renowHourhumiP = StateProvider((ref) => 0);
final reHourhumiP = StateProvider((ref) => 0);
final reHourtempP = StateProvider((ref) => 0);
final reHourco2P = StateProvider((ref) => 0);


