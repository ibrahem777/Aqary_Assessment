import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';

class BlocPage extends StatefulWidget {
  const BlocPage({Key? key}) : super(key: key);

  @override
  _BlocPageState createState() => _BlocPageState();
}

class _BlocPageState extends State<BlocPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bloc Page'),
      ),
      body: Center(
        child: BlocProvider<CounterBloc>(create: (BuildContext context) =>CounterBloc(),

        child: Builder(
          builder: (context) {
            return BlocConsumer<CounterBloc,int>(
              listener: (context, state) {},
              builder: (context, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Counter : $state',
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(onPressed: (){
                          context.read<CounterBloc>().add(Increment());
                        }, icon: Icon(Icons.add)),
                        IconButton(onPressed: (){
                          context.read<CounterBloc>().add(Decrement());

                        }, icon: Icon(Icons.remove)),
                      ],
                    )
                  ],
                );
              },
            );
          }
        ),),

      ),
    );
  }
}
