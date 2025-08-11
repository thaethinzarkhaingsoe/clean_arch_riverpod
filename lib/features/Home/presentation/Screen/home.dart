import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerStatefulWidget{
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();

}
class _HomeScreenState extends ConsumerState{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Center(
       child: Text('Home'),
     ),
   );
  }

}