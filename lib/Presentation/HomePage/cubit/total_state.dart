part of 'total_cubit.dart';

sealed class TotalState extends Equatable {
  final int total;
  const TotalState({required this.total});

  @override
  List<Object> get props => [total];
}

final class TotalInitial extends TotalState {
  const TotalInitial({required super.total});
  @override
  List<Object> get props => [total];
}

final class TotalLoaded extends TotalState {
  const TotalLoaded({required super.total});
  @override
  List<Object> get props => [total];
}
