import 'package:flutter/material.dart';
import 'package:register/Domain/Entities/price_data_entity.dart';

class CstListTile extends StatelessWidget {
  final PriceDataEntity data;
  const CstListTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
