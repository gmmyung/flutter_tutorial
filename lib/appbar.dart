import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

class MyBottomAppBar extends StatefulWidget {
  const MyBottomAppBar({Key? key}) : super(key: key);

  @override
  State<MyBottomAppBar> createState() => _MyBottomAppBarState();
}

class _MyBottomAppBarState extends State<MyBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 34),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          HeroIcon(HeroIcons.phone, solid: true),
          HeroIcon(HeroIcons.chat, solid: true),
          HeroIcon(HeroIcons.user, solid: true),
        ],
      ),
    );
  }
}
