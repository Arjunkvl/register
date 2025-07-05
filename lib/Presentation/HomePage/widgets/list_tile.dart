import 'package:flutter/material.dart';

class CstListTile extends StatelessWidget {
  const CstListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
      child: Container(
        decoration: BoxDecoration(
           color: Theme.of(context).colorScheme.inversePrimary,
           borderRadius: BorderRadius.circular(15)
        ),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        width: 300,
       
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("3/4/25", style: Theme.of(context).textTheme.displaySmall),
            Text("70", style: Theme.of(context).textTheme.displaySmall),
            Text("70", style: Theme.of(context).textTheme.displaySmall),
          ],
        ),
      ),
    );
  }
}
