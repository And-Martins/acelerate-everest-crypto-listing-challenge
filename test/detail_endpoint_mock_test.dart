import 'package:crypto_listing/cripto_details/endpoint/get_detail_endpoint.dart';
import 'package:crypto_listing/cripto_details/repository/get_detail_repo.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'api_local/api_factory.dart';

class DetailEndpointMock extends Mock implements GetDetailEndpoint {}

void main() {
  late DetailEndpointMock detailEndpointMock;
  late GetDetailRepo getDetailRepo;

  setUp(
    () {
      detailEndpointMock = DetailEndpointMock();
      getDetailRepo = GetDetailRepo(detailEndpointMock);
    },
  );

  test('WHEN getCryptoDetailList is request THEN mock is called', () async {
    when(() => detailEndpointMock.getCryptoDetailList('bitcoin')).thenAnswer(
      (invocation) async => Response(
        data: ApiFactory.getCryptoDetailList(),
        requestOptions: RequestOptions(
          path: Faker().internet.httpUrl(),
        ),
      ),
    );
    await getDetailRepo.getDetailList('bitcoin');
    verify((() => detailEndpointMock.getCryptoDetailList('bitcoin'))).called(1);
  });
}
