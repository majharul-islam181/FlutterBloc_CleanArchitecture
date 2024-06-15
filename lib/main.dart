import 'package:flutter/material.dart';
import 'package:flutterbloc_cleanarchitecture/config/routes/routes_name.dart';
import 'package:flutterbloc_cleanarchitecture/repository/movies/movies_http_api_repository.dart';
import 'package:flutterbloc_cleanarchitecture/repository/movies/movies_repository.dart';

import 'config/routes/routes.dart';
import 'package:get_it/get_it.dart';

//dependency enjections
GetIt getIt = GetIt.instance;

void main() {
  servicesLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: RoutesName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}

void servicesLocator() {
 getIt.registerLazySingleton<MoviesRepository>(() => MoviesHttpApiRepository()); 
}
