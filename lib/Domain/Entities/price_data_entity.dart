import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'price_data_entity.g.dart';

@HiveType(typeId: 0)
class PriceDataEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String date;
  @HiveField(2)
  final int price;
  @HiveField(3)
  final int total;
  const PriceDataEntity({
    required this.id,
    required this.total,
    required this.date,
    required this.price,
  });

  @override
  List<Object?> get props => [date, price, total,id];
}
