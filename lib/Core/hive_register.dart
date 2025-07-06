import 'package:hive_flutter/hive_flutter.dart';
import 'package:register/Domain/Entities/price_data_entity.dart';

Future<void> hiveInit() async {
  await Hive.initFlutter();
  Hive.registerAdapter(PriceDataEntityAdapter());
  await Hive.openBox<PriceDataEntity>('box');
  await Hive.openBox<int>('total');
}