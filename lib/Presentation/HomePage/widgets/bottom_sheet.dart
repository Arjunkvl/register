import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:register/Presentation/HomePage/bloc/home_page_bloc.dart';

class CstmBottomSheet extends StatefulWidget {
  const CstmBottomSheet({super.key});

  @override
  State<CstmBottomSheet> createState() => _CstmBottomSheetState();
}

class _CstmBottomSheetState extends State<CstmBottomSheet> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              onTapOutside: (event) => FocusScope.of(context).unfocus(),
              textAlign: TextAlign.center,
              decoration: InputDecoration.collapsed(
                hintText: '0',
                hintStyle: Theme.of(context).textTheme.displayLarge,
              ),
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          SizedBox(height: 10),
          MaterialButton(
            minWidth: 100,
            height: 40,
            color: Theme.of(context).colorScheme.inversePrimary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15),
            ),
            onPressed: () {
              // await showDatePicker(
              //       context: context,
              //       firstDate: DateTime(2025, 1, 1),
              //       lastDate: DateTime(2026, 1, 1),
              //     ) ??
              //     DateTime.now();
              context.read<HomePageBloc>().add(
                AddPriceDataEvent(
                  id: 0,
                  price: int.parse(_controller.text),
                  date: DateTime.now(),
                ),
              );
              Navigator.of(context).pop();
            },
            child: Text(
              "Conform",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
