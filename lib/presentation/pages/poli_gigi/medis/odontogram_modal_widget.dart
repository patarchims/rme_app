// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import 'package:hms_app/domain/models/gigi/assets_gigi_model.dart';
import 'package:hms_app/domain/models/gigi/gigi_model.dart';
import 'package:hms_app/presentation/component/fonts/font_helper.dart';
import 'package:hms_app/presentation/component/form/form_textfield_widget.dart';

class OdontogramModalWidget extends StatelessWidget {
  final List<GigiModel> listGigi;
  final List<AssetsGigiModel> newListAssestGigiModel;
  const OdontogramModalWidget({
    Key? key,
    required this.listGigi,
    required this.newListAssestGigiModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return SizedBox(
          width: Get.width / 2,
          child: Column(
            children: [
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: 12.sp, vertical: 12.sp),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.sp),
                    color: Colors.white),
                child: Wrap(
                  children: newListAssestGigiModel
                      .map((e) => InkWell(
                            onTap: () {
                              setState(() {
                                // selectedImage = e.imgAssets;
                              });
                            },
                            // child: Container(
                            //   height: 25.sp,
                            //   width: 25.sp,
                            //   margin: EdgeInsets.all(2.sp),
                            //   decoration: BoxDecoration(
                            //       border: Border.all(
                            //           width: (selectedImage == e.imgAssets)
                            //               ? 3.sp
                            //               : 0,
                            //           color: (selectedImage == e.imgAssets)
                            //               ? Colors.green
                            //               : Colors.transparent),
                            //       image: DecorationImage(
                            //           image: AssetImage("assets/odon/" +
                            //               e.imgAssets +
                            //               ".png"))),
                            // ),
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 40.sp,
                      child: DropdownButtonFormField(
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        value: "selectedNumber",
                        items: listGigiModelUser
                            .map((e) => DropdownMenuItem(
                                  value: e.numberGigi,
                                  child: Text(
                                    e.numberGigi.toString(),
                                    overflow: TextOverflow.ellipsis,
                                    style: blackTextStyle.copyWith(
                                        fontWeight: FontWeight.w100,
                                        fontSize: 6.sp),
                                  ),
                                ))
                            .toList()
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            // ondogram = value.toString();
                            // selectedNumber = value as int;
                          });
                        },
                        decoration: FormWidget.styleDropdown(context),
                        style: blackTextStyle.copyWith(
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5.sp,
                    ),
                    Expanded(
                        child: FormWidget.textForm(
                      // controller:
                      //     _valueController,
                      enable: true,
                    )),
                    SizedBox(
                      width: 15.sp,
                    ),
                    SizedBox(
                      width: 25.sp,
                      height: 15.sp,
                      child: ElevatedButton(
                          onPressed: () {
                            // if (_valueController.text ==
                            //     "") {
                            //   setState(
                            //       () {
                            //     Alert.failure(context,
                            //         "Keterangan tidak boleh kosong");
                            //   });
                            // } else {
                            // VALIDASI TERLEBIH DAHULU
                            // SIMPAN ODONTOGRAM

                            // context.read<PasienBloc>().add(PasienEvent.saveOdontogram(
                            //     noReg: widget.noReg,
                            //     noGigi: selectedNumber.toString(),
                            //     keterangan: selectedImage + "," + _valueController.text));

                            // addOntogram(odontogramModel: OdontogramModel(number: selectedNumber, imageUrl: selectedImage, keterangan: _valueController.text));

                            // Navigator.of(context).pop();

                            // log(widget.ontogramList.toString());

                            // validasiList(items: items);
                            // }
                          },
                          child: FaIcon(FontAwesomeIcons.circlePlus)),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
