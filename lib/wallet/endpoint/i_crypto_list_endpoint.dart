import 'package:dio/dio.dart';

abstract class ICryptoListEndpoint {
  Future<Response> getCryptoList();
}
