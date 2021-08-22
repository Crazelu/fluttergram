import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttergram/models/post.dart';
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
      case SinglePostViewRoute:
        final post = settings.arguments;
        if (post != null && post is Post) {
          return _getPageRoute(SinglePostView(post: post), settings);
        }
        return _getPageRoute(_errorPage(message: "Post missing"));

      case ProfileUpdateViewRoute:
        return _getPageRoute(ProfileUpdateView(), settings);
      case CommentsViewRoute:
        final postId = settings.arguments;
        if (postId != null && postId is String) {
          return _getPageRoute(CommentsView(postId: postId), settings);
        }
        return _getPageRoute(_errorPage(message: "postId missing"));

      case AuthBridgeViewRoute:
        return _getPageRoute(AuthBridgeView(), settings);
      case HomeViewRoute:
        return _getPageRoute(HomeView(), settings);

      case GuestProfileViewRoute:
        final userId = settings.arguments;
        if (userId != null && userId is String) {
          return _getPageRoute(GuestProfileView(userId: userId), settings);
        }
        return _getPageRoute(_errorPage(message: "UserId missing"));

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
