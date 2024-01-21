part of 'column_bloc.dart';

class ColumnState {}

class ColumnInitial extends ColumnState {}

class AlignmentState extends ColumnState {
  AlignmentState({
    required this.alignment,
    required this.cAxisAlignment,
  });

  final MainAxisAlignment alignment;
  final CrossAxisAlignment cAxisAlignment;
}


