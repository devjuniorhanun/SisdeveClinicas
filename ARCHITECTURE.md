# Arquitetura

MVVM - Model-View-ViewModel. É uma arquitetura de design que visa separar preocupações e facilitar a manutenção, testabilidade e escalabilidade de aplicativos. O MVVM é especialmente popular em desenvolvimento de aplicativos.

# Objetivo

Desenvolver um aplicativo de Gerenciamento de Clinicas Ususando o Flutter.

# Regras iniciais, limite e Análise

- Todo o projeto respeita as regras de Lint escritas no pacote analysis_options.
- Projeto divido em Pacotes.
-- Core

# Entidades
- users.: Usuários do Sistema.
- adm_users.: Administradores do Sistema.
- attendantDeskAssignment.: Terminal que o Atendente ira realizar o atendimento.
- patients.: Pacientes.
- patientInformationForm.: Informações do Paciente.
- painelCheckin.: Informações de senha

# Casos de Uso

Sistema de Gerenciamento Clinico


# Design Patterns
- Core Project: Padrão de Desenvolvimento de Projetos, orientado a Pacotes 
- Repository Pattern: Para acesso a API externa.
- Service Pattern: Para isolar trechos de códigos com outras responsabilidades.
- Dependency Injection: Resolver dependências das classes.
- Store: Guardar e mudar estados.
- State pattern: Padrão que auxilia no gerenciamento estados.
- Adapter: Converter um objeto em outro.
- Result: Trabalhar com retorno Múltiplo.


# Package externos (Comum)
- flutter_getit: Gerenciador de dependências no ciclo de vida de projetos em Flutter.
- signals_flutter: Uma ferramenta gerenciamento de estado.
- json_rest_server: Um servidor RESTful 100% funcional com autenticação, paginação e todos os serviços necessários para desenvolvimento de aplicações
- dio: Cliente HTTP.
- top_snackbar_flutter: Permite elevar sua experiência com o SnackBar.
- asyncstate: Pacote de Carregamentos de métodos assíncronos.
- loading_animation_widget: Plugin de Carregando animação.
- shared_preferences: Armazenamento persistente de Dados.
- pretty_dio_logger: Logger do Dio interceptador que registra chamadas de rede em um formato agradavel.

