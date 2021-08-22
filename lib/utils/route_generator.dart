import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../presentation/views/views.dart';
import '../utils/utils.dart';

class RouteGenerator {
  ///Generates routes, extracts and passes navigation arguments.
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case SplashScreenViewRoute:
        return _getPageRoute(SplashScreen(), settings);
      case SignUpViewRoute:
        return _getPageRoute(SignUpView(), settings);
      case LoginViewRoute:
        return _getPageRoute(LoginView(), settings);
      case FeedViewRoute:
        return _getPageRoute(FeedView(), settings);
      case SinglePostViewRoute:
        return _getPageRoute(SinglePostView(), settings);
      case UserMediaViewRoute:
        return _getPageRoute(UserMediaView(), settings);
      case ProfileUpdateViewRoute:
        return _getPageRoute(ProfileUpdateView(), settings);
      case AddPostViewRoute:
        return _getPageRoute(AddPostView(), settings);
      case CommentsViewRoute:
        return _getPageRoute(CommentsView(), settings);
      case AuthBridgeViewRoute:
        return _getPageRoute(AuthBridgeView(), settings);
      case HomeViewRoute:
        return _getPageRoute(HomeView(), settings);
      case SearchViewRoute:
        return _getPageRoute(SearchView(), settings);

      default:
        return _getPageRoute(_errorPage());
    }
  }

  //Wraps widget with a CupertinoPageRoute and adds route settings
  static CupertinoPageRoute _getPageRoute(
    Widget child, [
    RouteSettings settings = const RouteSettings(),
  ]) =>
      CupertinoPageRoute(
        builder: (context) => child,
        settings: RouteSettings(
          name: settings.name,
          arguments: settings.arguments,
        ),
      );

  ///Error page shown when app attempts navigating to an unknown route
  static Widget _errorPage({String message = "Error! Page not found"}) =>
      Scaffold(
        appBar: AppBar(
            title: const Text(
          'Page not found',
          style: TextStyle(color: Colors.red),
        )),
        body: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red),
          ),
        ),
      );
}
