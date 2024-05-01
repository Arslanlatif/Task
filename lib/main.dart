import 'package:flutter/material.dart';
import 'package:flutter_application_3/controllers/upcomingmoviewBloc/upcoming_movies_bloc.dart';
import 'package:flutter_application_3/model/apiProvider.dart';
import 'package:flutter_application_3/view/bottom_nav_screens./upcoming_movies_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UpComingMoviesBloc>(
          create: (context) => UpComingMoviesBloc(UpcomingMoviesApiProvider()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UpcomingMoviesScreen(),
      ),
    );
  }
}
