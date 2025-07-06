import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:register/Domain/Entities/price_data_entity.dart';
import 'package:register/Domain/Repository/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  int _findnextId(Box<PriceDataEntity> box) {
    if (box.isEmpty) return 1;
    return box.values.map((e) => e.id).reduce((a, b) => a > b ? a : b)+1;
  }

  @override
  Future<void> addPrice({
    required int id,
    required int price,
    required DateTime date,
  }) async {
    final box = Hive.box<PriceDataEntity>('box');
    final totalBox = Hive.box<int>('total');
    final total = (totalBox.get(0) ?? 0) + price;
    final ids =  _findnextId(box);
    await totalBox.put(0, total);
    final formattedDate = "${date.month}/${date.day}/${date.year}";
    final data = PriceDataEntity(
      id: ids,
      total: total,
      date: formattedDate,
      price: price,
    );
    await box.put(ids, data);
  }

  @override
  Future<void> removePrice({required PriceDataEntity data}) async {
    
    final box = Hive.box<PriceDataEntity>('box');
    await box.delete(data.id);

    final totalBox = Hive.box<int>('total');
    final total = totalBox.get(0)! - data.price;
    await totalBox.put(0, total);
  }

  @override
  void updatePrice({
    required int id,
    required int price,
    required DateTime date,
  }) {
    // TODO: implement updatePrice
  }

  @override
  Future<Option<List<PriceDataEntity>>> getPriceDataList() async {
    final box = Hive.box<PriceDataEntity>('box');
    return Some(box.values.toList());
  }
}
