import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_new_ver/bloc/bloc/counter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: MainPage()
        )
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    CounterBloc cbloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Updated Bloc")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<CounterBloc,CounterState>(
              builder: (context,counterState) =>  Text(
                counterState.value.toString(),style: const TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<CounterBloc,CounterState>(
                  builder: (context,state) => FloatingActionButton(onPressed: () {
                    if(state.value > 0){
                       cbloc.add(Decrement());
                    }
                   
                  },child: const Icon(Icons.arrow_downward),),
                ),
                const SizedBox(width: 20,),
                FloatingActionButton(onPressed: () {
                  cbloc.add(Increment());
                },child: const Icon(Icons.arrow_upward),),

            ],)
          ],
        ),
      ),
    );
  }
}
