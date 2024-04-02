// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:hms_app/domain/bloc/user/auth/auth_bloc.dart';
// import 'package:hms_app/presentation/component/color/color_helper.dart';
// import 'package:hms_app/presentation/pages/asesment/soap/perawat/skrining_pasien/batuk_widget.dart';
// import 'package:hms_app/presentation/pages/asesment/soap/perawat/skrining_pasien/intervensi_widget.dart';
// import 'package:hms_app/presentation/pages/asesment/soap/perawat/skrining_pasien/kegawatan_widget.dart';
// import 'package:hms_app/presentation/pages/asesment/soap/perawat/skrining_pasien/keterbatasan_fisik_widget.dart';
// import 'package:hms_app/presentation/pages/asesment/soap/perawat/skrining_pasien/risiko_jatuh_widget.dart';

// class SkriningPasienContentWidget extends StatelessWidget {
//   final List<String> menu;
//   const SkriningPasienContentWidget({
//     Key? key,
//     required this.menu,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     AuthState authState = context.watch<AuthBloc>().state;

//     return Expanded(
//         child: DefaultTabController(
//       length: menu.length, // Added
//       initialIndex: 0, //A
//       child: Scaffold(
//         backgroundColor: ThemeColor.bgColor,
//         appBar: AppBar(
//           backgroundColor: Colors.blue.withOpacity(0.5),
//           foregroundColor: Colors.black,
//           surfaceTintColor: Colors.black,
//           flexibleSpace: SafeArea(
//               child: TabBar(
//             labelColor: ThemeColor.primaryColor,
//             unselectedLabelColor: Colors.black,
//             dividerColor: Colors.white,
//             indicatorColor: ThemeColor.primaryColor,
//             onTap: (index) {
//               log("INDEX TAB " + index.toString());

//               if (index == 2) {
//                 // LAKUKAN GET INFOMRASI MEDIS
//                 // if (singlePasien.isNotEmpty) {
//                 //   context.read<InformasiMedisBloc>().add(
//                 //       InformasiMedisEvent.getInformasiMedis(
//                 //           singlePasien.first.noreg.toString(),
//                 //           singlePasien.first.kdBagian.toString()));
//                 // }
//               }
//             },
//             tabs: menu
//                 .map(
//                   (e) => Tab(
//                     text: e,

//                     // icon: Icon(Icons.cloud_outlined),
//                   ),
//                 )
//                 .toList(),
//           )),
//           leading: null,
//           elevation: 0,
//           automaticallyImplyLeading: false,
//         ),
//         body: TabBarView(
//             children: menu.map((e) {
//           // TAMPILKAN ISI
//           if (e == menu.first) {
//             return KegawatanWidget();
//           }

//           if (e == menu[1]) {
//             return KeterbatasanFisikWidget();
//           }

//           if (e == menu[2]) {
//             return BatukWidget();
//           }
//           if (e == menu[3]) {
//             return RisikoJatuhWidget();
//           }
//           if (e == menu[4]) {
//             return IntervensiWidget();
//           }

//           return Container();
//         }).toList()),
//       ),
//     ));
//   }
// }
