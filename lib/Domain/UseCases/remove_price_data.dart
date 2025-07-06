import 'package:register/Domain/Entities/price_data_entity.dart';
import 'package:register/Domain/Repository/register_repo.dart';

class RemovePriceData {
  final RegisterRepo repository;
  RemovePriceData({required this.repository});

  Future<void> call({required PriceDataEntity data}) async{
     await repository.removePrice(data: data);
  }
}
