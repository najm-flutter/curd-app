import 'package:block_test/bloc/bloc/name_change_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          MaterialButton(
            onPressed: () => BlocProvider.of<NameChangeBloc>(context).add(CraeteNameChangeEvent()),
            child: Text("create"),
          ),
          MaterialButton(
            onPressed: () => BlocProvider.of<NameChangeBloc>(context).add(ClearNameChangeEvent()),
            child: Text("clear"),
          ),
          MaterialButton(
            onPressed: () => BlocProvider.of<NameChangeBloc>(context).add(RestNameChangeEvent()),
            child: Text("rest"),
          ),
          BlocBuilder<NameChangeBloc, NameChangeState>(
            builder: (context, state) {
              if (state is NameChangeloaded) {
                return Text(state.name!);
              } 
              return Text('');
            },
          )
        ],
      ),
    );
  }
}
