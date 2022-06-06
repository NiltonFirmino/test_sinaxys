import 'package:flutter_test/flutter_test.dart';
import 'package:test_sinaxys/app/core/data/service/jobs_service.dart';

void main() {
  test('Testando se não retorna vázio a busca do Local por ID na API',
      () async {
    final store = JobsService();
    final result = await store.getJobs();
    expect(result, isNotEmpty);
  });


}