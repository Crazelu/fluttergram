import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/shared/shared.dart';
import 'presentation/themes/light_theme.dart';
import 'utils/utils.dart';
import 'handlers/navigation_handler.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 630),
      builder: () => MultiProvider(
        providers: AppProvider.providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'App',
          theme: lightTheme,
          navigatorKey: locator<NavigationHandler>().navigatorKey,
          onGenerateRoute: RouteGenerator.onGenerateRoute,
          initialRoute: SplashScreenViewRoute,
          builder: (context, widget) => Navigator(
            onGenerateRoute: (settings) => CupertinoPageRoute(
              builder: (context) => DialogManager(
                child: widget!,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
