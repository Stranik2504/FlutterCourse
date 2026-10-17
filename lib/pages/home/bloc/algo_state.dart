part of 'algo_bloc.dart';

@immutable
sealed class AlgoState {
  const AlgoState();
}

final class AlgoInitial extends AlgoState {
  const AlgoInitial();
}

// Загрузка
final class AlgoLoading extends AlgoState {
  const AlgoLoading();
}

// Успешная загрузка: получен список терминов
final class AlgoLoaded extends AlgoState {
  final List<Algo> terms;
  const AlgoLoaded(this.terms);
}

// Ошибка при загрузке
final class AlgoError extends AlgoState {
  final String message;
  const AlgoError(this.message);
}