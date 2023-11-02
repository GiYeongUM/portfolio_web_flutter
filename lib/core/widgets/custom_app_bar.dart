import 'package:flutter/material.dart';
import 'package:giyeong_um_porfolio_page/core/config/config.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title = '',
    this.actions = const [],
    this.bottom,
    this.color,
  }) : super();

  final String title;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      bottom: bottom,
      elevation: 0,
      leadingWidth: 64,
      title: AnimatedAlign(
        alignment: ResponsiveBreakpoints.of(context).isDesktop ? Alignment.center : Alignment.topLeft,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        child: Text(title, style: context.textTheme.krPoint1),
      ),
      actions: actions,
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
