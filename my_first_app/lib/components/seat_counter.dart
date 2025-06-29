import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_first_app/cubit/counter/counter_cubit.dart';
import 'package:my_first_app/cubit/counter/counter_state.dart';

class SeatCounter extends StatelessWidget {
  const SeatCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterCubit(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Number of Seats',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          const SizedBox(height: 16),

          // Increment / Decrement buttons and seat count
          BlocBuilder<CounterCubit, CounterState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(
                        8,
                      ), // Optional: rounded corners
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.remove, color: Colors.white),
                      onPressed: state.seats > 0
                          ? () => context.read<CounterCubit>().decrement()
                          : null,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    '${state.seats}',
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    icon: const Icon(Icons.add, color: Colors.white),
                    onPressed: () => context.read<CounterCubit>().increment(),
                  ),
                ],
              );
            },
          ),

          const SizedBox(height: 20),

          // Cancel and Submit buttons
          BlocConsumer<CounterCubit, CounterState>(
            listenWhen: (prev, curr) => prev.seats != curr.seats,
            listener: (context, state) {
              if (state.seats == 0) {
                Fluttertoast.showToast(
                  msg: "Please enter valid number of seats.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                );
              }
            },
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll<Color>(
                        Colors.grey[400]!,
                      ),
                    ),
                    onPressed: () {
                      context.read<CounterCubit>().reset();
                      Fluttertoast.showToast(
                        msg: "Your seat selection cancelled.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        backgroundColor: Colors.redAccent,
                        textColor: Colors.white,
                      );
                    },
                    child: Text('Cancel'),
                  ),
                  const SizedBox(width: 20),
                  Visibility(
                    visible: state.enabledSubmit,
                    child: FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll<Color>(
                          Colors.blue,
                        ),
                      ),
                      onPressed: () {
                        Fluttertoast.showToast(
                          msg: "Your preferred number of seats submitted.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.blueAccent,
                          textColor: Colors.white,
                        );
                      },
                      child: const Text('Submit'),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
