import 'package:faker/faker.dart';

class ApiFactory {
  static List<Map<String, dynamic>> getCryptoList() => [
        {
          "id": faker.lorem.word(),
          "symbol": faker.lorem.word(),
          "name": faker.lorem.word(),
          "image": faker.image.toString(),
          "currentPrice": faker.randomGenerator.decimal(scale: 1000),
          "marketCapChangePercentage24h":
              faker.randomGenerator.decimal(scale: 5),
        },
      ];
  static Map<String, List<List<double>>> getCryptoDetailList() => {
        'prices': [
          [
            faker.randomGenerator.decimal(scale: 1000),
            faker.randomGenerator.decimal(scale: 100),
          ],
          [
            faker.randomGenerator.decimal(scale: 1000),
            faker.randomGenerator.decimal(scale: 100),
          ],
        ],
      };
}
