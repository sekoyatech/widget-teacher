import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'column_event.dart';

part 'column_state.dart';

class ColumnBloc extends Bloc<ColumnEvent, ColumnState> {
  ColumnBloc(super.initialState) {
    on<ColumnEvent>((event, emit) {});
    on<AlignmentEvent>(_mainAxisAlignmentState);
  }

  FutureOr<void> _mainAxisAlignmentState(AlignmentEvent event, Emitter<ColumnState> emit) async {
    emit(AlignmentState(alignment: event.alignment, cAxisAlignment: event.cAxisAlignment));
  }
}
