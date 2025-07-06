import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:register/Core/hive_register.dart';
import 'package:register/Presentation/HomePage/bloc/home_page_bloc.dart';
import 'package:register/Presentation/HomePage/cubit/total_cubit.dart';
import 'package:register/Presentation/HomePage/home_page.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await hiveInit();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomePageBloc()),
        BlocProvider(create: (context) => TotalCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          textTheme: TextTheme(
            displayLarge: const TextStyle(
              fontSize: 72,
              fontWeight: FontWeight.bold,
            ),

            titleLarge: GoogleFonts.oswald(
              fontSize: 30,
              // fontStyle: FontStyle.italic,
            ),
            bodyMedium: GoogleFonts.merriweather(),
            displaySmall: GoogleFonts.pacifico(fontSize: 20),
          ),
        ),
        home: HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
