import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'total_state.dart';

class TotalCubit extends Cubit<TotalState> {
  TotalCubit() : super(TotalInitial(total: 0));
  void updateTotal() {
    final box = Hive.box<int>('total');
    final total = box.get(0) ?? 0;
    log(total.toString());
    emit(TotalLoaded(total: total));
  }
}
