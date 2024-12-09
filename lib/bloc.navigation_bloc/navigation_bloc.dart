import 'package:bloc/bloc.dart';
import '../pages/myaccountspage.dart';
import '../pages/myorderpage.dart';

import '../pages/homepage.dart';

enum NavigationEvents{
  HomePageCLickedEvent,
  MyAccountClickedEvent,
  MyOrederClickedEvent,
}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates>{
  NavigationBloc(super.initialState);

  @override
  NavigationStates get initialState => const HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async*{
    switch(event){
      case NavigationEvents.HomePageCLickedEvent:
        yield const HomePage();
        break;
      case NavigationEvents.MyAccountClickedEvent:
        yield const MyAccountsPage();
        break;
      case NavigationEvents.MyOrederClickedEvent:
        yield const MyOrderPage();
        break;

    }

  }
}