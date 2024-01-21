part of 'row_bloc.dart';

class RowState {}

class RowInitial extends RowState {}

class RowAlignmentState extends RowState {
  RowAlignmentState({
    required this.alignment,
    required this.cAxisAlignment,
  });

  final MainAxisAlignment alignment;
  final CrossAxisAlignment cAxisAlignment;
}


