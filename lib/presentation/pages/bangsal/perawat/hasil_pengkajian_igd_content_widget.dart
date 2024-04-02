import 'package:flutter/material.dart';
import 'package:hms_app/presentation/component/component.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sizer/sizer.dart';

class HasilPengkajianIGDContentWidget extends StatefulWidget {
  const HasilPengkajianIGDContentWidget({super.key});

  @override
  State<HasilPengkajianIGDContentWidget> createState() =>
      _HasilPengkajianIGDContentWidgetState();
}

class _HasilPengkajianIGDContentWidgetState
    extends State<HasilPengkajianIGDContentWidget> {
  int selectedIndex = 0;
  late PageController pageController;
  ScrollController listController = ScrollController();
  ItemScrollController scrollController = ItemScrollController();
  late List<String> menu;

  @override
  void initState() {
    super.initState();
    selectedIndex = 0;
    pageController = PageController(initialPage: selectedIndex);
    super.initState();
    menu = [
      "Informasi Keluhan",
      "Skrining Nyeri",
      "Riwayat Kehamilan",
      "Skrining Resiko Dekubitus",
      "Tindak Lanjut"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 25.sp,
            decoration: const BoxDecoration(color: ThemeColor.primaryColor),
            child: ScrollablePositionedList.builder(
                itemScrollController: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: menu.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(right: (index == menu.last) ? 0 : 24),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          selectedIndex = index;
                          pageController.jumpToPage(index);
                        });
                      },
                      child: SizedBox(
                          child: Card(
                        color: const Color(0xFF8CC6F5).withOpacity(0.5),
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3.sp)),
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.sp),
                            child: Text(
                              menu[index].toString(),
                              textAlign: TextAlign.center,
                              style: (index == selectedIndex)
                                  ? blackTextStyle.copyWith(
                                      color: ThemeColor.whiteColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)
                                  : blackTextStyle.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      )),
                    ),
                  );
                }),
          ),
          Expanded(
              child: Container(
            color: ThemeColor.bgColor,
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  selectedIndex = index;
                  scrollController.scrollTo(
                      index: index,
                      duration: const Duration(milliseconds: 150),
                      alignment: 0.4);
                });
              },
              children: menu.map((e) {
                return Container(
                  color: ThemeColor.bgColor,
                  child: Center(
                    child: Text(
                      e,
                      style: whiteFredokaTextStyle.copyWith(
                          color: ThemeColor.blackColor),
                    ),
                  ),
                );
              }).toList(),
            ),
          ))
        ],
      ),
    );
  }
}
