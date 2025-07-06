import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:register/Data/Repository/register_repo_impl.dart';
import 'package:register/Domain/Entities/price_data_entity.dart';
import 'package:register/Domain/UseCases/add_price_data.dart';
import 'package:register/Domain/UseCases/get_price_data_list.dart';
import 'package:register/Domain/UseCases/remove_price_data.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  final addPriceData = AddPriceData(repository: RegisterRepoImpl());
  final removePriceData = RemovePriceData(repository: RegisterRepoImpl());
  final getPriceData = GetPriceDataList(repository: RegisterRepoImpl());
  HomePageBloc() : super(HomePageInitial()) {
    on<HomePageInitEvent>((event, emit) async {
      final data = await getPriceData.call();
      data.fold(
        () {
          emit(HomePageLoaded(data: []));
        },
        (res) {
          emit(HomePageLoaded(data: List.from(res)));
        },
      );
    });
    on<AddPriceDataEvent>((event, emit) async {
      await addPriceData.call(
        id: event.id,
        price: event.price,
        date: event.date,
      );
      final data = await getPriceData.call();
      data.fold(
        () {
          emit(HomePageLoaded(data: []));
        },
        (res) {
          emit(HomePageLoaded(data: res));
        },
      );
    });
    on<RemovePriceEvent>((event, emit) async {
      await removePriceData.call(data: event.data);
      add(HomePageInitEvent());
    });
  }
}
