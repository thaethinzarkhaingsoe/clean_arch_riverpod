import 'package:apptest/features/Home/presentation/Screen/home.dart';
import 'package:apptest/features/Login/presentations/screens/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref){
  return GoRouter(
    initialLocation: '/login',
      routes: [
        GoRoute(
            path: '/login',
            name: 'loginRoute',
            builder:(context, state)=> const LoginPage(),
        ),
        GoRoute(path: '/home',
        name: 'homeRoute',
        builder: (context,state)=>  HomeScreen())
      ]);
});