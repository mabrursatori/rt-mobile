import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rt_flutter/bloc/bloc.dart';
import 'package:rt_flutter/ui/pages/pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_) => PageBloc()),
    ], child: MaterialApp(debugShowCheckedModeBanner: false, home: Wrapper()));
  }
}
