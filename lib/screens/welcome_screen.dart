import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat_flutter/screens/login_screen.dart';
import 'package:flash_chat_flutter/screens/registration_screen.dart';
import 'package:flutter/material.dart';

import '../components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController aniController;
  late final Animation animation;

  @override
  void initState() {
    super.initState();

    aniController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: (this),
    );
    animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
        .animate(aniController);
    aniController.forward();
    aniController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    aniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: TextStyle(
                        fontSize: 35.0,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(
              text: 'Log in',
              color: Colors.lightBlueAccent,
              action: () => Navigator.pushNamed(context, LoginScreen.id),
            ),
            RoundedButton(
              text: 'Register',
              color: Colors.blueAccent,
              action: () => Navigator.pushNamed(context, RegistrationScreen.id),
            ),
          ],
        ),
      ),
    );
  }
}
