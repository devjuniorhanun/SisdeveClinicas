import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// Classe de Loader
/// Responsavel por gerenciar os Loader do sistema
final class LoaderCore extends AsyncOverlay {
  // Método Construtor
  LoaderCore()
      : super(
            // Configuração do Loader
            id: 0,
            builder:
                (BuildContext context, AsyncValue<RouteSettings> settings) {
              return Center(
                child: SizedBox(
                  // Tamanho de 80% da tela
                  width: MediaQuery.sizeOf(context).width * .8,
                  // Animação
                  child: LoadingAnimationWidget.inkDrop(
                    // Cor da Animação
                    color: Colors.orange,
                    // Tamanho da Animação
                    size: 50,
                  ),
                ),
              );
            });
}
