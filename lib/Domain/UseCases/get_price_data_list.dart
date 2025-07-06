import 'package:dartz/dartz.dart';
import 'package:register/Domain/Entities/price_data_entity.dart';
import 'package:register/Domain/Repository/register_repo.dart';

class GetPriceDataList {
  final RegisterRepo repository;
  GetPriceDataList({required this.repository});
  Future<Option<List<PriceDataEntity>>> call(){
    return repository.getPriceDataList();
  }
}