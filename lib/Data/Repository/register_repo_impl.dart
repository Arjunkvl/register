import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';
import 'package:register/Domain/Entities/price_data_entity.dart';
import 'package:register/Domain/Repository/register_repo.dart';

class RegisterRepoImpl implements RegisterRepo {
  @override
  Future<void> addPrice({
    required int id,
    required int price,
    required DateTime date,
  }) async {
    final box = Hive.box<PriceDataEntity>('box');
    final totalBox = Hive.box<int>('total');
    if (totalBox.isEmpty) {
      await totalBox.put(0, price);
    }
    final total = (totalBox.get(0) ?? 0) + price;
    await totalBox.put(0, total);
    final formattedDate = "${date.month}/${date.day}/${date.year}";
    final data = PriceDataEntity(
      id: id,
      total: total,
      date: formattedDate,
      price: price,
    );
    await box.add(data);
  }

  @override
  void removePrice({required int id}) {
    // TODO: implement removePrice
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
