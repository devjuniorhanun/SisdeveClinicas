/// Classe responsavel por tratar de Retornos
sealed class Either<L, R> {}
/// Classe responsavel por tratar os erros
class Left<L, R> extends Either<L,R> {
  final L value;
  Left(this.value);
}
/// Classe responsavel por tratar os retornos validos
class Right<L, R> extends Either<L,R> {
  final R value;
  Right(this.value);
}