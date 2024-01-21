part of 'row_bloc.dart';

class RowEvent {}

class RowAlignmentEvent extends RowEvent {
  RowAlignmentEvent({
    required this.alignment,
    required this.cAxisAlignment,
  });

  final MainAxisAlignment alignment;
  final CrossAxisAlignment cAxisAlignment;
}



