import 'package:crypto_listing/wallet/endpoint/crypto_list_endpoint.dart';
import 'package:crypto_listing/wallet/model/crypto_view_data.dart';
import 'package:crypto_listing/wallet/repository/get_list/crypto_repo.dart';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'api_local/shared/api_factory.dart';

class WalletEndpointMock extends Mock implements CryptoEndpoint {}

void main() {
  late WalletEndpointMock walletEndpointMock;
  late CryptoRepo cryptoRepo;

  var cryptoViewData = CryptoViewData(
    id: Faker().lorem.word(),
    symbol: Faker().lorem.word(),
    name: Faker().lorem.word(),
    image: Faker().image.toString(),
    currentPrice: Faker().randomGenerator.decimal(scale: 1000).toDouble(),
    marketCapChangePercentage24h:
        Faker().randomGenerator.decimal(scale: 5).toDouble(),
  );

  setUp(
    () {
      walletEndpointMock = WalletEndpointMock();
      cryptoRepo = CryptoRepo(walletEndpointMock);
    },
  );

  test('WHEN getCryptoList is request THEN mock is called', () async {
    when(() => walletEndpointMock.getCryptoList()).thenAnswer(
      (invocation) async => Response(
        data: ApiFactory.getCryptoList(),
        requestOptions: RequestOptions(
          path: Faker().internet.httpUrl(),
        ),
      ),
    );
    await cryptoRepo.getCryptoList();
    verify((() => walletEndpointMock.getCryptoList())).called(1);
  });
}
