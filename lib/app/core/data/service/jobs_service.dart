import 'dart:core';


import '../../model/job_model.dart';
import 'config/api_service.dart';

class JobsService {
  final APIService _service = APIService();

  Future getJobs() async {
    final _response = await _service.doRequest(
      RequestConfig(
        'jobs',
        HttpMethod.get,
      ),
    );

    List<Jobs> _jobs =
        (_response["data"]["jobs"] as List).map((e) => Jobs.fromJson(e)).toList();
    return _jobs;
  }
}
