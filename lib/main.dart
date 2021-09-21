import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layout/home_layout.dart';
import 'package:social_app/modules/login_screen/login_screen.dart';
import 'package:social_app/shared/bloc/cubit.dart';
import 'package:social_app/shared/bloc/cubit_state.dart';
import 'package:social_app/shared/bloc_observer.dart';
import 'package:social_app/shared/components/constants.dart';
import 'package:social_app/shared/network/local/cache_helper.dart';
import 'package:social_app/shared/styles/theme.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  CacheHelper.init();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  uId = CacheHelper.getData(key:"uid");
  Widget widget;
  if (uId != null){
    widget=HomeLayOut();
  }else{
    widget=LoginScreen();
  }
  runApp(MyApp(startPage: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startPage;

  const MyApp({required this.startPage});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SocialCubitApp()..getUserData(),
        child: BlocConsumer<SocialCubitApp,SocialStateApp>(
          listener: (BuildContext context, state) {  },
          builder: (BuildContext context, Object? state) {
            return MaterialApp(
              theme: lightTheme,
              darkTheme:darkTheme,
              debugShowCheckedModeBanner: false,
              themeMode:ThemeMode.light,
              home: Scaffold(
                body: startPage,
              ),
            );
          },)
    );
  }
}
