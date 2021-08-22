import 'package:firebase_core/firebase_core.dart';
import 'package:get_it/get_it.dart';
import '../handlers/handlers.dart';

GetIt locator = GetIt.instance;

///Registers dependencies
Future<void> setupLocator() async {
  await Firebase.initializeApp();
  locator
      .registerLazySingleton<NavigationHandler>(() => NavigationHandlerImpl());
  locator.registerLazySingleton<DialogHandler>(() => DialogHandlerImpl());
}
