import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:solari/features/auth/presentation/cubits/signout/signout_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<SignOutCubit, SignOutState>(
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                context.read<SignOutCubit>().signOutEvent();
              },
              child: const Text('name'),
            ),
          );
        },
      ),
    );
  }
}
