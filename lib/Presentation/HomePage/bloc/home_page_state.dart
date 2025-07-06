part of 'home_page_bloc.dart';

sealed class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object> get props => [];
}

final class HomePageInitial extends HomePageState {}

final class HomePageLoading extends HomePageState {}

final class HomePageLoaded extends HomePageState {
  final List<PriceDataEntity> data;
  const HomePageLoaded({required this.data});
  @override
  List<Object> get props => [data];
}
