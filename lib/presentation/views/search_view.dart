import 'package:flutter/material.dart';
import 'package:fluttergram/presentation/shared/shared.dart';
import 'package:fluttergram/presentation/view-models/view_models.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final searchVM = context.watch<SearchVM>();
    return ResponsiveWidget(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: TextField(
          controller: controller,
          onChanged: (val) {
            if (val.isNotEmpty) {
              context.read<SearchVM>().search(val);
            }
          },
          decoration: InputDecoration.collapsed(
            hintText: 'Search users...',
          ),
        ),
      ),
      builder: (_) {
        return ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          itemCount: searchVM.sortedUsers.length,
          itemBuilder: (_, index) {
            return UserCard(user: searchVM.sortedUsers[index]);
          },
        );
      },
    );
  }
}
