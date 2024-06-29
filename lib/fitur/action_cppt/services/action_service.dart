import 'package:dartz/dartz.dart';
import 'package:hms_app/domain/network/api_failure_handler.dart';
import 'package:hms_app/domain/network/api_success_handler.dart';
import 'package:hms_app/domain/network/endpoints.dart';
import 'package:hms_app/domain/network/my_dio.dart';
import 'package:hms_app/fitur/action_cppt/dto/action_dto.dart';

class ActionServices {
  Future<Either<ApiFailureResult, ApiSuccessResult>> onSaveActionCppt({
    required String noAskep,
    required String deskripsi,
  }) {
    return MyDio().postDataWithToken(
      endPoint: EndPoint.actionTindakanKeperawatan,
      data: ActionDTO.onSaveActionKeperawatan(
        deskripsi: deskripsi,
        noAskep: noAskep,
      ),
    );
  }

  Future<dynamic> onGetTindakan({
    required String noAskep,
  }) {
    return MyDio().getAndToken(
      endPoint: EndPoint.viewTindakan,
      data: ActionDTO.onGetTindakan(
        noAskep: noAskep,
      ),
    );
  }
}

final actionServices = ActionServices();
