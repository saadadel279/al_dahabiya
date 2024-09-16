import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_model/cubit/counter_cubit.dart'; // Your cubit file path

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<CounterCubit, int>(
        builder: (context, state) {
          final counterCubit = context.read<CounterCubit>();

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFB0EAFD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: counterCubit.decrement,
                  icon: const Icon(Icons.remove),
                  iconSize: 36,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  '$state',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              // Increment Button
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFB0EAFD),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: counterCubit.increment,
                  icon: const Icon(Icons.add),
                  iconSize: 36,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
