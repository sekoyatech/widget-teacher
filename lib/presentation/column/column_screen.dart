import 'package:devflutter/presentation/column/bloc/column_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'const/const.dart';

class ColumnScreen extends StatelessWidget {
  const ColumnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ColumnBloc>(context).add(
      AlignmentEvent(alignment: Const.mainAxisAlignment, cAxisAlignment: Const.crossAxisAlignment),
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Column"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Const.crossAxisAlignment = CrossAxisAlignment.start;
            Const.mainAxisAlignment = MainAxisAlignment.start;
            Navigator.pop(context);
          },
        )
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Flexible(
            flex: 6,
            child: BlocBuilder<ColumnBloc, ColumnState>(
              builder: (context, state) {
                if (state is AlignmentState) {
                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    verticalDirection: VerticalDirection.down,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        margin: const EdgeInsets.fromLTRB(10, 0,10, 0),
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey[200],
                        ),
                        child: Column(
                          mainAxisAlignment: Const.mainAxisAlignment,
                          crossAxisAlignment: Const.crossAxisAlignment,
                          children: [
                            Text("Column 1", style: TextStyle(fontSize: 12)),
                            Text("Column 2", style: TextStyle(fontSize: 12)),
                            Text("Column 3", style: TextStyle(fontSize: 12)),
                            Text("Column 4", style: TextStyle(fontSize: 12)),
                            Text("Column 5", style: TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Flexible(
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      padding: const EdgeInsets.all(5),
                                      margin: const EdgeInsets.all(0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.grey[200],
                                      ),
                                      child: Text(
                                        '''
...
Column(
    mainAxisAlignment: ${Const.mainAxisAlignment},
    crossAxisAlignment: ${Const.crossAxisAlignment},
      children: [
          Text("Column 1"),
          Text("Column 2"),
          Text("Column 3"),
          Text("Column 4"),
          Text("Column 5"),
      ],
),
...''',
                                        style: TextStyle(fontSize: 12),
                                      ),
                                    ),
                                    Positioned(
                                      top: 0,
                                      right: 0,
                                      child: IconButton(icon: Icon(Icons.copy, size: 18), onPressed: () {}),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                FormBuilderRadioGroup(
                                  name: 'alignment',
                                  initialValue: MainAxisAlignment.start,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    labelText: 'MainAxisAlignment',
                                    labelStyle: TextStyle(fontSize: 16),
                                  ),
                                  options: const [
                                    FormBuilderFieldOption(
                                      value: MainAxisAlignment.start,
                                      child: Text('Start', style: TextStyle(fontSize: 12)),
                                    ),
                                    FormBuilderFieldOption(
                                      value: MainAxisAlignment.center,
                                      child: Text('Center', style: TextStyle(fontSize: 12)),
                                    ),
                                    FormBuilderFieldOption(
                                      value: MainAxisAlignment.end,
                                      child: Text('End', style: TextStyle(fontSize: 12)),
                                    ),
                                    FormBuilderFieldOption(
                                      value: MainAxisAlignment.spaceBetween,
                                      child: Text('SpaceBetween', style: TextStyle(fontSize: 12)),
                                    ),
                                    FormBuilderFieldOption(
                                      value: MainAxisAlignment.spaceAround,
                                      child: Text('SpaceAround', style: TextStyle(fontSize: 12)),
                                    ),
                                    FormBuilderFieldOption(
                                      value: MainAxisAlignment.spaceEvenly,
                                      child: Text('SpaceEvenly', style: TextStyle(fontSize: 12)),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    Const.mainAxisAlignment = value!;
                                    context.read<ColumnBloc>().add(
                                          AlignmentEvent(alignment: Const.mainAxisAlignment, cAxisAlignment: Const.crossAxisAlignment),
                                        );
                                  },
                                ),
                                SizedBox(height: 5),
                                FormBuilderRadioGroup(
                                  wrapRunSpacing: 0,
                                  wrapSpacing: 0,
                                  name: 'crossAxisAlignment',
                                  initialValue: CrossAxisAlignment.start,
                                  decoration: const InputDecoration(
                                    contentPadding: EdgeInsets.all(0),
                                    labelText: 'CrossAxisAlignment',
                                    labelStyle: TextStyle(fontSize: 16),
                                  ),
                                  options: const [
                                    FormBuilderFieldOption(
                                      value: CrossAxisAlignment.start,
                                      child: Text('Start', style: TextStyle(fontSize: 12)),
                                    ),
                                    FormBuilderFieldOption(
                                      value: CrossAxisAlignment.center,
                                      child: Text('Center', style: TextStyle(fontSize: 12)),
                                    ),
                                    FormBuilderFieldOption(
                                      value: CrossAxisAlignment.end,
                                      child: Text('End', style: TextStyle(fontSize: 12)),
                                    ),
                                  ],
                                  onChanged: (value) {
                                    Const.crossAxisAlignment = value!;
                                    context.read<ColumnBloc>().add(
                                          AlignmentEvent(alignment: Const.mainAxisAlignment, cAxisAlignment: Const.crossAxisAlignment),
                                        );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
