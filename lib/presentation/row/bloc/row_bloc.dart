import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'row_event.dart';

part 'row_state.dart';

class RowBloc extends Bloc<RowEvent, RowState> {
  RowBloc(super.initialState) {
    on<RowEvent>((event, emit) {});
    on<RowAlignmentEvent>(_mainAxisAlignmentState);
  }

  FutureOr<void> _mainAxisAlignmentState(RowAlignmentEvent event, Emitter<RowState> emit) async {
    emit(RowAlignmentState(alignment: event.alignment, cAxisAlignment: event.cAxisAlignment));
  }
}
