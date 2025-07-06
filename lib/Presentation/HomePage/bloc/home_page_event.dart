part of 'home_page_bloc.dart';

class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object> get props => [];
}

class AddPriceDataEvent extends HomePageEvent {
  final int id;
  final int price;
  final DateTime date;
  const AddPriceDataEvent({required this.id,required this.price,required this.date});
}
