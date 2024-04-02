import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:hms_app/domain/bloc/bloc.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:hms_app/presentation/component/color/color_helper.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';

class LoginSearchWidget extends StatefulWidget {
  const LoginSearchWidget({
    super.key,
  });

  @override
  State<LoginSearchWidget> createState() => _RiwayatSekarangSearchWidgetState();
}

class _RiwayatSekarangSearchWidgetState extends State<LoginSearchWidget> {
  final ScrollController _scrollController = ScrollController();

  late TextEditingController _textController;
  String valueSearch = "";

  @override
  void initState() {
    _textController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.clear();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: SizedBox(
                height: 25.sp,
                child: FormWidget.textForm(
                    autoFocus: true,
                    controller: _textController,
                    enable: true,
                    onChanged: (val) {
                      setState(() {
                        valueSearch = val;
                      });
                    }),
              ),
            ),
            SizedBox(width: 5.sp),
          ],
        ),
        SizedBox(
          height: 6.sp,
        ),
        BlocConsumer<CreateUserBloc, CreateUserState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Expanded(
                child: SizedBox(
              child: RawScrollbar(
                thumbColor: ThemeColor.darkColor,
                thumbVisibility: true,
                interactive: true,
                thickness: 10.sp,
                controller: _scrollController,
                trackVisibility: false,
                radius: Radius.circular(5.sp),
                child: ListView(
                  padding: EdgeInsets.only(right: 10.sp),
                  controller: _scrollController,
                  children: (state.pelayanan.isNotEmpty)
                      ? state.pelayanan
                          .where((element) => element.bagian
                              .toLowerCase()
                              .contains(valueSearch.toLowerCase()))
                          .map((e) => Card(
                                elevation: 0,
                                color: ThemeColor.bgColor,
                                child: ListTile(
                                  onTap: () {
                                    // KETIKA DI ONTAP
                                    context.read<CreateUserBloc>().add(
                                        CreateUserEvent.selectedUserLogin(
                                            selected: e.kdBagian));

                                    context.read<SignInFormBloc>().add(
                                        SignInFormEvent.selectedUserLogin(
                                            selectedUser: e.kdBagian));

                                    Get.back();
                                  },
                                  title: Text(
                                    e.bagian,
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    e.kdBagian,
                                    style:
                                        blackTextStyle.copyWith(fontSize: 5.sp),
                                  ),
                                  trailing: IconButton(
                                      onPressed: () {
                                        context.read<CreateUserBloc>().add(
                                            CreateUserEvent.selectedUserLogin(
                                                selected: e.kdBagian));

                                        context.read<SignInFormBloc>().add(
                                            SignInFormEvent.selectedUserLogin(
                                                selectedUser: e.kdBagian));

                                        Get.back();
                                      },
                                      icon: const Icon(
                                        Icons.arrow_circle_right,
                                        color: Colors.black,
                                      )),
                                ),
                              ))
                          .toList()
                      : [
                          Container(),
                        ],
                ),
              ),
            ));
          },
        ),
      ],
    );
  }
}
