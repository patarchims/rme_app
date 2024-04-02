import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MedisCppGigitWidget extends StatelessWidget {
  const MedisCppGigitWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child: DataTable2(
            columns: [
              DataColumn2(
                label: DefaultTextStyle.merge(
                    softWrap: true,
                    child: Text(
                      'Edit Header 1',
                    )),
              ),
              DataColumn2(
                label: DefaultTextStyle.merge(
                  softWrap: true,
                  child: Text(
                    'Edit Header 2',
                  ),
                ),
              ),
            ],
            rows: [],
            headingRowHeight: 56,
            dataRowHeight: 56,
            border: TableBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            dividerThickness: 1,
            showBottomBorder: true,
            minWidth: 49,
          ),
        ),
      ),
    );
  }
}
