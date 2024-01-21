import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../presentation/column/bloc/column_bloc.dart';
import '../presentation/home/home_screen.dart';
import '../presentation/row/bloc/row_bloc.dart';

void main() {
  runApp(const DevFlutter());
}

class DevFlutter extends StatelessWidget {
  const DevFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColumnBloc>(create: (_) => ColumnBloc(ColumnInitial())),
        BlocProvider<RowBloc>(create: (_) => RowBloc(RowInitial())),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DevHomScreen(),
      ),
    );
  }
}
