import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../models/algo.dart';
import '../../../data/algos_repository.dart';

part 'algo_event.dart';
part 'algo_state.dart';

class AlgoBloc extends Bloc<AlgoEvent, AlgoState> {
  final AlgosRepository repository;
  
  AlgoBloc(this.repository) : super(const AlgoInitial()) {
    on<LoadAlgoEvent>(_onLoadAlogs);
  }

  Future<void> _onLoadAlogs(LoadAlgoEvent event, Emitter<AlgoState> emit) async {
    emit(const AlgoLoading());
    try {
      // Simulate a delay for loading data
      await Future.delayed(const Duration(seconds: 2));

      final alogs = await repository.getAlgos();
      emit(AlgoLoaded(alogs));
    } catch (e) {
      emit(AlgoError(e.toString()));
    }
  }
}
