import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';

class AppProvider {
  //The providers for dependency injection and state management will be added here
  //as the app will use MultiProvider
  static final providers = <SingleChildWidget>[
    ChangeNotifierProvider(create: (_) => SignUpVM()),
    ChangeNotifierProvider(create: (_) => LoginVM()),
    ChangeNotifierProvider(create: (_) => CreatePostVM()),
    ChangeNotifierProvider(create: (_) => FeedVM()),
    ChangeNotifierProvider(create: (_) => HomeVM()),
    ChangeNotifierProvider(create: (_) => ProfileVM()),
    ChangeNotifierProvider(create: (_) => SearchVM()),
    ChangeNotifierProvider(create: (_) => GuestProfileVM()),
    ChangeNotifierProvider(create: (_) => CommentVM()),
  ];
}
