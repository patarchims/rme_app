import 'package:flutter/material.dart';
import 'package:hms_app/presentation/pages/widget/header_content_widget.dart';

class AsesmenHDContentWidgetPage extends StatelessWidget {
  const AsesmenHDContentWidgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HeaderContentWidget(
      isENableAdd: true,
      onPressed: () {},
      title: "Simpan",
      widget: const SingleChildScrollView(
        child: Column(
          children: [
            //
          ],
        ),
      ),
    );
  }
}
