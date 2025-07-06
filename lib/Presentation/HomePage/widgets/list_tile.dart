import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/Domain/Entities/price_data_entity.dart';
import 'package:register/Presentation/HomePage/bloc/home_page_bloc.dart';

class CstListTile extends StatelessWidget {
  final PriceDataEntity data;
  const CstListTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      confirmDismiss: (direction) async {
        bool dissmiss = false;
        await showCupertinoDialog(
          context: context,
          builder: (context) => CupertinoAlertDialog(
            title: Text('Removing Song'),
            content: Text('Are you sure you want to remove this'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                child: Text('No'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              CupertinoDialogAction(
                onPressed: () {
                  dissmiss = true;
                  Navigator.of(context).pop();
                },
                textStyle: TextStyle(color: Colors.white),
                child: Text('Yes'),
              ),
            ],
          ),
        );

        return dissmiss;
      },
      onDismissed: (direction) {
        log("called");
        context.read<HomePageBloc>().add(RemovePriceEvent(data: data));
      },
      key: Key(data.price.toString()),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.inversePrimary,
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10),
          height: 70,
          width: 300,

          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data.date.toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                data.price.toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
              Text(
                data.total.toString(),
                style: Theme.of(context).textTheme.displaySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
