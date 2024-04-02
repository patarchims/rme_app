import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/speech/speech_api.dart';

class HeaderPageWidget extends StatefulWidget {
  final String title;
  final Widget body;
  final Widget? floatingButton;

  const HeaderPageWidget({
    super.key,
    required this.title,
    required this.body,
    this.floatingButton,
  });

  @override
  State<HeaderPageWidget> createState() => _HeaderPageWidgetState();
}

class _HeaderPageWidgetState extends State<HeaderPageWidget> {
  String text = 'Press the button and start speaking';
  bool isListening = false;
  Color bgColors = Colors.white;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: true,
      top: true,
      child: Scaffold(
        backgroundColor: bgColors,
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: widget.floatingButton,
        appBar: AppBar(
          backgroundColor: ThemeColor.primaryColor,
          foregroundColor: Colors.white,
          title: Text(widget.title),
        ),
        body: Container(
            height: Get.height,
            width: Get.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color(0xFF1060AE),
                Color(0xFF8FA8BD),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
            child: widget.body),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => text = text),
        onListening: (isListening) {
          setState(() => isListening = isListening);

          if (!isListening) {
            Future.delayed(const Duration(seconds: 1), () {
              List<String> result = text.split(" ");
              for (int a = 0; a < result.length; a++) {
                if (result[0] == "keyword") {
                  // METHOD DI SINI
                  switch (result[1]) {
                    case "background":
                      if (result[2] == "merah" || result[2] == "red") {
                        setState(() {
                          bgColors = Colors.red;
                        });
                      }
                      if (result[2] == "kuning" || result[2] == "yellow") {
                        setState(() {
                          bgColors = Colors.yellow;
                        });
                      }
                      if (result[2] == "hitam" || result[2] == "black") {
                        setState(() {
                          bgColors = Colors.black;
                        });
                      }
                      break;
                    default:
                  }
                }
              }
            });
          }
        },
      );
}
