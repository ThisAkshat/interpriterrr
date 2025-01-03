import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import '../pages/homepage.dart';
import 'sidebar.dart';

class SideBarLayout extends StatelessWidget {
  const SideBarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:BlocProvider<NavigationBloc>(
            create: (context) => NavigationBloc(const HomePage()),
            child: Stack(
            children:<Widget>[
              BlocBuilder<NavigationBloc, NavigationStates>(
             builder:(context, navigationState){
            return navigationState as Widget;
    },
    ),
            const SideBar(),
          ],
        ),
    ),
    );
  }
}
