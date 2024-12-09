import 'package:flutter/material.dart';
import 'package:interpriter/Screens/signin_screen.dart';
import 'package:interpriter/Screens/signup_screen.dart';
import '../widget/custom_scaffold.dart';
import '../widget/welcome_buttons.dart';

class WelcomeScreen extends StatelessWidget{
  const WelcomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      child:Column(
        children:[
          Flexible(
              flex: 8,
              child: Container(
                padding:const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 40.0
                ),
                child: Center(
                  child: RichText(textAlign: TextAlign.center,
                    text:const TextSpan(
                      children: [
                        TextSpan(
                            text: 'Welcome!\n',
                            style:TextStyle(
                              fontSize: 45.0,
                              fontWeight: FontWeight.w600,
                            )
                        ),
                        TextSpan(
                            text:
                            '\nEnter your details to start using the sign language interpreter service',
                            style:TextStyle(
                              fontSize:20,
                            )
                        )
                      ],
                    ),
                  ),
                ),
              )),
          const Flexible(
            flex: 1,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Row(
                children: [
                  Expanded(
                    child: WelcomeButton(
                      buttonText: 'sign in',
                      onTap: SignInScreen(),
                      color: Colors.transparent,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(child: WelcomeButton(
                    buttonText: 'sign up',
                    onTap: SignUpScreen(),
                    color: Colors.white,
                    textColor: Colors.black,
                  ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}