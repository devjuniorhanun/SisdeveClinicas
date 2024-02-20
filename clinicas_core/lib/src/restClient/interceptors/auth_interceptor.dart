import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/local_storage_key.dart';

/// Classe AuthInterceptor
/// Reponsavel por interceptar todas os requesições com o servidor
final class AuthInterceptor extends Interceptor {
  // Método invocado antes da requisição
  @override
  Future<void> onRequest(
      // Instancia o token de autorisação ao cabeçalho de requisição
      RequestOptions options,
      RequestInterceptorHandler handler) async {
    // Extrai o headers e o extra de option
    final RequestOptions(:headers, :extra) = options;
    // Instancia a autorização
    const authHeaderKey = 'Authorization';
    // Remove a autorização padrão
    headers.remove(authHeaderKey);

    // Verifica se a chave DIO_AUTH_KEY existe
    if (extra case {'DIO_AUTH_KEY': true}) {
      // Recupera a instancia da chave token
      final sp = await SharedPreferences.getInstance();

      // Instancia a chave token ao cabeçalho de requisição
      headers.addAll({
        authHeaderKey: 'Bearer ${sp.getString(LocalStorageKey.accessToken)}'
      });
    }
    // Passa as configurações para o Dio
    handler.next(options);
  }
}
