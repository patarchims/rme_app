import 'package:hms_app/domain/models/dto/dto.dart';

import '../../../domain/network/my_dio.dart';

class BHPServices {
  // GET ALL ICD 10
  Future<dynamic> getBHPHD({required String noReg}) {
    return MyDio().getAndToken(
        data: DTO.getNoreg(noReg: noReg), endPoint: "/v1/bhp-dializer");
  }

  // SAVE BHPHD
}

final bhpServices = BHPServices();
