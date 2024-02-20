import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'interceptors/auth_interceptor.dart';

/// Classe RestClient
/// Reponsavel p or gerenciar as conexão com o servidor
final class RestClient extends DioForNative {
  // Método Construtor, que receber as base da url do servidor
  RestClient(String baseUrl)
      : super(
          // Configurações basicas do Dio
          BaseOptions(
            // Endereço do servidor
            baseUrl: baseUrl,
            // Tempo de espera de uma conexão com o servidor
            connectTimeout: const Duration(seconds: 10),
            // Tempo de respostas do servidor
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    // Instanciando o interceptor
    interceptors.addAll([
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
      AuthInterceptor(),
      PrettyDioLogger(),
    ]);
  }

// Método com autenticação
  RestClient get auth {
    // Chave com token de autenticação
    options.extra['DIO_AUTH_KEY'] = true;
    return this;
  }

// Método sem autenticação
  RestClient get unauth {
    // Limpa a chave com o token
    options.extra['DIO_AUTH_KEY'] = false;
    return this;
  }
}
