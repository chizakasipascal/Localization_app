import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:localizationbloc/app_local.dart';

import 'cubt/ local_cubit.dart';
import 'cubt/local_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.home),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<LocalCubit, LocalState>(builder: (context, state) {
            if (state is ChangeLocalState) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<LocalCubit>(context)
                            .changeLanguage('en');
                      },
                      child: const Text(
                        'en',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      )),
                  TextButton(
                      onPressed: () {
                        BlocProvider.of<LocalCubit>(context)
                            .changeLanguage('fr');
                      },
                      child: const Text(
                        'fr',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                        ),
                      )),
                ],
              );
            }
            return const SizedBox();
          }),
          Center(
            child: Text(
              'title'.tr(context),
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
          )
        ],
      ),
    );
  }
}
