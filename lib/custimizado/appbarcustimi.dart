import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;

  const CustomAppBar({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromARGB(255, 252, 247, 247),
      elevation: 0,
      title: title,
      centerTitle: false,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ))
      ],
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(kToolbarHeight + 10);
}
