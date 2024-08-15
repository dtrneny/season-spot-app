import 'package:flutter/material.dart';
import 'package:season_spot/core/theming/index.dart';

class BaseScreen extends StatelessWidget {
  final Widget child;
  final AppBar? appBar;

  const BaseScreen({ super.key, required this.child, this.appBar });

  @override
  Widget build(BuildContext context){
    return Scaffold( 
      appBar: appBar,
      body: Padding( 
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20), 
        child: child,
      ), 
    );
  }
}