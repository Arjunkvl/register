import 'package:dartz/dartz.dart';
import 'package:register/Domain/Entities/price_data_entity.dart';

abstract class RegisterRepo {
  Future<void> addPrice({required int id, required int price, required DateTime date});
  Future<Option<List<PriceDataEntity>>> getPriceDataList();
  void removePrice({required int id});
  void updatePrice({
    required int id,
    required int price,
    required DateTime date,
  });
}
