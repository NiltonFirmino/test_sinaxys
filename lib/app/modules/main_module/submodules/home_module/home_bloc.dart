import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/data/service/config/base_response.dart';
import '../../../../core/data/service/jobs_service.dart';
import '../../../../core/model/job_model.dart';

class HomeBloc implements Disposable {
  final jobsService = JobsService();

  late StreamController<BaseResponse<List<Jobs>>> jobsController;

  List<Jobs> jobs = [];

  HomeBloc() {
    jobsController = StreamController.broadcast();
  }

  Future getAllJobs() async {
    try {
      jobsController.sink.add(BaseResponse.loading());
      final jobs = await jobsService.getJobs();
      jobsController.sink.add(BaseResponse.completed(data: jobs));
    } catch (e) {
      jobsController.sink.add(BaseResponse.error(e.toString()));
    }
  }

  @override
  void dispose() {
    jobsController.close();
  }
}
