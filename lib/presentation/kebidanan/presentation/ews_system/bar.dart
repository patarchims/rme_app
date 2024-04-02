// Chart(
//                               state: ChartState<void>(
//                                   foregroundDecorations: [
//                                     // DecorationPainter()
//                                     HorizontalAxisDecoration(
//                                         lineColor: ThemeColor.primaryColor,
//                                         axisStep: 102,
//                                         showValues: true)
//                                   ],
//                                   backgroundDecorations: [
//                                     HorizontalAxisDecoration(
//                                         lineColor: ThemeColor.primaryColor,
//                                         axisStep: 2,
//                                         showValues: true),
//                                   ],
//                                   data: ChartData([
//                                     state.earlyWarningSystem
//                                         .map((e) =>
//                                             ChartItem<void>(e.td.toDouble()))
//                                         .toList()
//                                   ]),
//                                   itemOptions: BarItemOptions(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 2.sp),
//                                       barItemBuilder: (itemBuilderData) {
//                                         return BarItem(
//                                             color:
//                                                 itemBuilderData.listIndex == 0
//                                                     ? Colors.red
//                                                     : Colors.blue);
//                                       })),
//                             )