import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: controller,
          decoration: InputDecoration.collapsed(
            hintText: 'Search users...',
          ),
        ),
      ),
      builder: (_) {
        return ListView();
      },
    );
  }
}
