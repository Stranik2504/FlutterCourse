part of 'algo_bloc.dart';

@immutable
sealed class AlgoEvent {
  const AlgoEvent();
}

final class LoadAlgoEvent extends AlgoEvent {
  const LoadAlgoEvent();
}