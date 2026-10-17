import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../mock/algo_data.dart';
import '../../../models/algo.dart';

part 'algo_event.dart';
part 'algo_state.dart';

class AlgoBloc extends Bloc<AlgoEvent, AlgoState> {
  AlgoBloc() : super(const AlgoInitial()) {
    on<LoadAlgoEvent>(_onLoadAlogs);
  }

  Future<void> _onLoadAlogs(LoadAlgoEvent event, Emitter<AlgoState> emit) async {
    emit(const AlgoLoading());
    try {
      // Simulate a delay for loading data
      await Future.delayed(const Duration(seconds: 2));

      emit(AlgoLoaded(alogs));
    } catch (e) {
      emit(AlgoError(e.toString()));
    }
  }
}
