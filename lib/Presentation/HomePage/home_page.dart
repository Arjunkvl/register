

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/Presentation/HomePage/bloc/home_page_bloc.dart';
import 'package:register/Presentation/HomePage/cubit/total_cubit.dart';
import 'package:register/Presentation/HomePage/widgets/bottom_sheet.dart';
import 'package:register/Presentation/HomePage/widgets/list_tile.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomePageBloc>().add(HomePageInitEvent());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            // isScrollControlled: true,
            context: context,
            builder: (context) => CstmBottomSheet(),
          );
        },
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 20,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        BlocBuilder<TotalCubit, TotalState>(
                          builder: (context, state) {
                            log("total called");
                            return Text(
                              state.total.toString(),
                              style: Theme.of(context).textTheme.displayLarge,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 55),
                child: BlocBuilder<HomePageBloc, HomePageState>(
                  builder: (context, state) {
                    if (state is HomePageLoaded) {
                      context.read<TotalCubit>().updateTotal();
                      return ListView.builder(
                        itemCount: state.data.length,
                        itemBuilder: (context, index) =>
                            CstListTile(data: state.data[index]),
                      );
                    } else {
                      return SizedBox.shrink();
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
