import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:instagram_clone/core/helpers/helpers.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: EdgeInsets.only(top: 50.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Text('reshat0'),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          NavbarButton(
            icon: getIcon('archive_icon.png'),
            text: 'Archive',
          ),
          NavbarButton(
            icon: getIcon('activity_icon.png'),
            text: 'Activity',
          ),
          NavbarButton(
            icon: getIcon('nametag.png'),
            text: 'Nametag',
          ),
          NavbarButton(
            icon: getIcon('save.png'),
            text: 'Saved',
          ),
          NavbarButton(
            icon: getIcon('close_friends.png'),
            text: 'Close Friends',
          ),
          NavbarButton(
            icon: getIcon('discover_people.png'),
            text: 'Disvover People',
          ),
          Spacer(),
          NavbarButton(
            icon: getIcon('settings.png'),
            text: 'Settings',
          ),
        ]),
      ),
    );
  }

  Image getIcon(String path) => Image.asset(
        iconsPath(path),
        width: 30,
      );
}

class NavbarButton extends StatelessWidget {
  const NavbarButton({
    super.key,
    required this.icon,
    required this.text,
  });
  final Widget icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 15,
            ),
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(text)
          ],
        ),
        const SizedBox(
          height: 20,
        )
      ],
    );
  }
}
