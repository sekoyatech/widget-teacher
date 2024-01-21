part of 'column_bloc.dart';

class ColumnEvent {}

class AlignmentEvent extends ColumnEvent {
  AlignmentEvent({
    required this.alignment,
    required this.cAxisAlignment,
  });

  final MainAxisAlignment alignment;
  final CrossAxisAlignment cAxisAlignment;
}



