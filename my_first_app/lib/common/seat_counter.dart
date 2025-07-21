
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_first_app/common/events/events.dart';
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
                      ), 
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

        
          BlocConsumer<CounterCubit, CounterState>(
            // listenWhen: (prev, curr) => prev.seats != curr.seats,
            listener: (context, state) {
              var cubit = context.read<CounterCubit>();
              if (cubit.isListenerInPlay){
                print("Log from myself : entered listener execution.");
                if (!state.enabledSubmit) {
                Fluttertoast.showToast(
                  msg: "Please enter valid number of seats.",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.redAccent,
                  textColor: Colors.white,
                );
              }             
              else if (state.isMaxExceeded){
                 Navigator.pushNamed(context, '/max-seats-page');
                 cubit.resetIsListenerInPlay();
                 cubit.resetState();
              }
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
                      context.read<CounterCubit>().resetState();
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
                      onPressed: ()  {
                      
                        eventBus.fire(SeatsValueSubmitted(sender : "Atulya") );
                        Navigator.pop(context);
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
