import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';

class TabbarWithoutExpandexWidget extends StatelessWidget {
  final List<String> menu;
  final Function(int)? onTap;
  final List<Widget> children;
  final Color? backgroundColor;
  const TabbarWithoutExpandexWidget({
    super.key,
    required this.menu,
    this.backgroundColor,
    this.onTap,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: menu.length, // Added
      child: Scaffold(
        backgroundColor: ThemeColor.transparentColor,
        appBar: AppBar(
          backgroundColor: backgroundColor ?? Colors.blue.withOpacity(0.5),
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          flexibleSpace: SafeArea(
              child: TabBar(
            labelColor: ThemeColor.primaryColor,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.white,
            indicatorColor: ThemeColor.primaryColor,
            onTap: onTap,
            tabs: menu
                .map(
                  (e) => Tab(
                    text: e,
                  ),
                )
                .toList(),
          )),
          leading: null,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(children: children),
      ),
    );
  }
}
