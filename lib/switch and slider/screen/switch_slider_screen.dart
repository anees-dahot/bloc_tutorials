import 'package:bloc_practice/switch%20and%20slider/bloc/switch_and_slider_bloc.dart';
import 'package:bloc_practice/switch%20and%20slider/bloc/switch_and_slider_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/switch_and_slider_event.dart';

class SwitchandSliderScreen extends StatelessWidget {
  const SwitchandSliderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Switch and Slider'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Notification'),
                BlocBuilder<NotificationBloc, NotificationState>(
                  bloc: context.read<NotificationBloc>(),
                  builder: (context, state) {
                    return Switch(
                      value: state.status,
                      onChanged: (value) {
                        context.read<NotificationBloc>().add(NotificationEvent(value));
                      },
                    );
                  },
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            BlocBuilder<OpacityBloc, OpacityState>(
              builder: (context, state) {
                return Container(
                  height: 300,
                  color: Colors.red.withOpacity(state.opacity),
                );
              },
            ),
            const SizedBox(height: 20),
            BlocBuilder<OpacityBloc, OpacityState>(
              builder: (context, state) {
                return Slider(
                  value: state.opacity,
                  onChanged: (newValue) {
                    context.read<OpacityBloc>().add(ChangeOpacity(newValue));
                  },
                  min: 0.0,
                  max: 1.0,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
