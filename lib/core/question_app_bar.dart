import 'package:flutter/material.dart';

class QuestionAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String pageTitle;

  const QuestionAppBar({
    super.key,
    required this.pageTitle,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(pageTitle),
      elevation: 1,
    );
  }

  @override
  Size get preferredSize => AppBar().preferredSize;
}
