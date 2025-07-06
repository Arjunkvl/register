import 'package:register/Domain/Repository/register_repo.dart';

class AddPriceData {
  final RegisterRepo repository;
  AddPriceData({required this.repository});

  Future<void> call({required id, required price, required date}) {
    return repository.addPrice(id: id, price: price, date: date);
  }
}
