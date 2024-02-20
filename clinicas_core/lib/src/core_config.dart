import 'package:asyncstate/asyncstate.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import '../src/loader/loader.dart';
import '../src/theme/theme_core.dart';

// Classe de configuração do aplicativo
class CoreConfig extends StatelessWidget {
  // Método Construtor
  const CoreConfig({
    super.key,
    this.binding,
    this.pages,
    this.pagesBuilders,
    this.modules,
    required this.title,
    this.didStart,
  });

  // Criação de Variáveis
  // Instanciando os Binding
  final ApplicationBindings? binding;
  // Instanciado a lista de páginas
  final List<FlutterGetItPageRouter>? pages;
  // Instanciado a lista de páginas de builders
  final List<FlutterGetItPageBuilder>? pagesBuilders;
  // Instanciado a lista de modulos
  final List<FlutterGetItModule>? modules;
  final String title; // Títudo
  final VoidCallback? didStart; // Método de VoidCallback

  @override
  Widget build(BuildContext context) {
    // Instanciando ao FlutterGetIt
    return FlutterGetIt(
      // Variável de debug
      debugMode: kDebugMode,
      bindings: binding, // Passa os bindings
      pages: [...pages ?? [], ...pagesBuilders ?? []],// Passa os pagesBuilders
      modules: modules,
      // Criando um builder do FlutterGetIt
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          // Chama o Loader
          loader: LoaderCore(),
          builder: (navigatorObserver) {
            if(didStart != null) {
              didStart!();
            }
            return MaterialApp(
              theme: ThemeCore.lightTheme,
              darkTheme: ThemeCore.darkTheme,
              // Chama a navegação
              navigatorObservers: [
                navigatorObserver,
                flutterGetItNavObserver,
              ],
              // Desabilita a faixa de debug
              debugShowCheckedModeBanner: false,
              // Passa as Rotas
              routes: routes,
              // Passa o Titulo
              title: title,
            );
          },
        );
      },
    );
  }
}