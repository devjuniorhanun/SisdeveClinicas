import 'package:flutter/material.dart';
import 'package:signals_flutter/signals_flutter.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

/// Classe Menssages
/// Responsável por Retornar as Mensagens.
final class Messages {
  /// Método responsável, mostar mensagem de erros
  static void showError(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message),
    );
  }

  /// Método responsável, mostar mensagem de informações
  static void showInfo(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message),
    );
  }

  /// Método responsável, mostar mensagem de sucessos
  static void showSuccess(String message, BuildContext context) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message),
    );
  }
}

/// Mixin
/// Responsável, por montar as mensagens dentro da controller
/// Gerenciamento dos status das mensagens
mixin MessageStateMixin {
  /// Status de Error
  final Signal<String?> _errorMessage = signal(null);

  /// Recupera a mensagem de Erro
  String? get errorMessage => _errorMessage();

  /// Status de Informações
  final Signal<String?> _infoMessage = signal(null);

  /// Recupera a mensagem de Informação
  String? get infoMessage => _infoMessage();

  /// Status de Sucesso
  final Signal<String?> _successMessage = signal(null);

  /// Recupera a mensagem de Sucesso
  String? get successMessage => _successMessage();

  /// Limpa o status de erro
  void clearError() => _errorMessage.value = null;

  /// Limpa o status de informação
  void clearInfo() => _infoMessage.value = null;

  /// Limpa o status de sucesso
  void clearSuccess() => _successMessage.value = null;

  /// Método que chama status de error
  void showError(String message) {
    // Desabilida a notificação de mudança de estado da mensagem
    untracked(() => clearError());
    // Notifica a mudança de status da mensagem
    _errorMessage.value = message;
  }

  /// Método que chama status de informação
  void showInfo(String message) {
    // Desabilida a notificação de mudança de estado da mensagem
    untracked(() => clearInfo());
    // Notifica a mudança de status da mensagem
    _infoMessage.value = message;
  }

  /// Método que chama status de sucesso
  void showSussess(String message) {
    // Desabilida a notificação de mudança de estado da mensagem
    untracked(() => clearSuccess());
    // Notifica a mudança de status da mensagem
    _successMessage.value = message;
  }

  /// Método que limpa todas as mensagens
  void clearAllMessages() {
    // Desabilida a notificação de mudança de estado da mensagem
    untracked(() {
      clearError();
      clearInfo();
      clearSuccess();
    });
  }
}

/// Responsável, por montar as mensagens dentro da view
mixin MessageViewMixin<T extends StatefulWidget> on State<T> {
  /// Método responsavel por notificar os status das mensagens
  void messageListener(MessageStateMixin state) {
    /// Fica escutando as mudanças de status das mensagens
    effect(() {
      switch (state) {
        // Ser for uma mensagem de erro
        case MessageStateMixin(:final errorMessage?):
          Messages.showError(errorMessage, context);
        // Ser for uma mensagem de informação
        case MessageStateMixin(:final infoMessage?):
          Messages.showInfo(infoMessage, context);
        // Ser for uma mensagem de sucesso
        case MessageStateMixin(:final successMessage?):
          Messages.showSuccess(successMessage, context);
      }
    });
  }
}
