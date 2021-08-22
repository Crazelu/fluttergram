import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';
import 'package:fluttergram/presentation/views/feed_view.dart';
import 'package:fluttergram/presentation/views/views.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final pageController = PageController();
  int currentIndex = 0;

  void jumpToPage(int index) {
    currentIndex = index;
    setState(() {});
    pageController.jumpToPage(index);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await context.read<FeedVM>().setUpSnapshotStreamSubscription();
      await context.read<HomeVM>().setUpSnapshotStreamSubscription();
      context.read<SearchVM>().setUpSnapshotStreamSubscription();
      await context.read<HomeVM>().getUserMedia();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 22.w,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        unselectedItemColor: Theme.of(context).primaryColorDark.withOpacity(.5),
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 15,
        selectedItemColor: Theme.of(context).primaryColorDark,
        currentIndex: currentIndex,
        onTap: jumpToPage,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            activeIcon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline,
            ),
            activeIcon: Icon(
              Icons.add_circle,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
            ),
            activeIcon: Icon(
              Icons.person,
            ),
            label: '',
          )
        ],
      ),
      builder: (_) {
        return PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
            FeedView(),
            SearchView(),
            AddPostView(),
            UserMediaView(),
          ],
        );
      },
    );
  }
}
