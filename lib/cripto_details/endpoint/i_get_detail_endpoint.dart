import 'package:dio/dio.dart';

abstract class IGetDetailEndpoint {
  Future<Response> getCryptoDetailList(String id);
}
