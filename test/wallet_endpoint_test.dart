import 'package:crypto_listing/wallet/endpoint/crypto_list_endpoint.dart';
import 'package:crypto_listing/wallet/model/crypto_view_data.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'api_local/shared/api_factory.dart';

class WalletEndpointTest extends Mock implements Dio {}

void main() {
  late Response<Map<String, dynamic>> sucess;
  late WalletEndpointTest walletEndpointTest;
  late CryptoEndpoint cryptoEndpoint;

  When mockGetResponse() => when(() => walletEndpointTest.get(any(),
      queryParameters: any(named: 'queryParameters')));

  mockResponse(Set<List<CryptoViewData>> factory, int statusCode) =>
      Response(
          data: factory,
          statusCode: statusCode,
          requestOptions: RequestOptions(path: faker.internet.httpUrl()));

  setUp(() {
    walletEndpointTest = WalletEndpointTest();
    cryptoEndpoint = CryptoEndpoint(walletEndpointTest);
  });

  setUp(() {
    sucess = mockResponse(ApiFactory.getCryptoList(), 200) as Response<Map<String, dynamic>>;
  });

  test('When getCryptoList is request THEN returns 200', (() async {
    mockGetResponse().thenAnswer((_) async => sucess);
    final result = await cryptoEndpoint.getCryptoList();
    expect(result.statusCode, equals(200));
    expect(result, sucess);
  }));
}
