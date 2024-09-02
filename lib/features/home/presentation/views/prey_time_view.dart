import 'package:ana_muslim/core/widgets/spacers.dart';
import 'package:ana_muslim/features/home/presentation/cubit/home_cubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PreyTimeView extends StatelessWidget {
  const PreyTimeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<HomeCubitCubit>(
        create: (context) => HomeCubitCubit(),
        child: Column(
          children: [
            const VerticalSpacer(height: 12),
            Text('Muhammed Ashraf'),
            BlocBuilder<HomeCubitCubit, HomeCubitState>(
              buildWhen: (previous, current) =>
                  current is FetchingPreyTimeState ||
                  current is FetchingPreyTimeErrorState ||
                  current is FetchingPreyTimeSuccessState,
              builder: (context, state) {
                if (state is FetchingPreyTimeSuccessState) {
                  return const Center(
                    child: Text("Hello"),
                  );
                }
                return Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
