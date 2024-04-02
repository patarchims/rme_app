import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';

class AsesmenKebutuhanEdukasiWidget extends StatelessWidget {
  final List<String> menu;
  const AsesmenKebutuhanEdukasiWidget({
    Key? key,
    required this.menu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DefaultTabController(
      length: menu.length, // Added
      initialIndex: 0, //A
      child: Scaffold(
        backgroundColor: ThemeColor.bgColor,
        appBar: AppBar(
          backgroundColor: Colors.blue.withOpacity(0.5),
          foregroundColor: Colors.black,
          surfaceTintColor: Colors.black,
          flexibleSpace: SafeArea(
              child: TabBar(
            labelColor: ThemeColor.primaryColor,
            unselectedLabelColor: Colors.black,
            dividerColor: Colors.white,
            indicatorColor: ThemeColor.primaryColor,
            onTap: (index) {
              log("INDEX TAB $index");

              if (index == 2) {}
            },
            tabs: menu
                .map(
                  (e) => Tab(
                    text: e,

                    // icon: Icon(Icons.cloud_outlined),
                  ),
                )
                .toList(),
          )),
          leading: null,
          elevation: 0,
          automaticallyImplyLeading: false,
        ),
        body: TabBarView(
            children: menu.map((e) {
          // TAMPILKAN ISI
          // if (e == menu.first) {
          //   return BacaDanBahasaWidget(
          //     title: e,
          //   );
          // }
          return Container();
        }).toList()),
      ),
    ));
  }
}
