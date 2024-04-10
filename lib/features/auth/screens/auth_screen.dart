import 'package:amazon_clone/common/buttons/custom_button.dart';
import 'package:amazon_clone/common/widgets/custom_textfields.dart';
import 'package:amazon_clone/const/constants.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = "/auth-screen";
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signup;
  final _signupkey = GlobalKey<FormState>();
  final _signinkey = GlobalKey<FormState>();
  TextEditingController _name = new TextEditingController();
  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  void setState(VoidCallback fn) {
    // TODO: implement setState
    super.setState(fn);
    // dispose();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: globalVariables.greyBackgroundCOlor,
        body: SafeArea(
          child: Column(
            children: [
              const Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(fontSize: 25),
                ),
              ),
              ListTile(
                selectedTileColor:
                    Colors.white, // Set selected tile color to white

                title: const Text('Create An Account'),
                leading: Radio(
                  activeColor: globalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signup)
                Form(
                  key: _signupkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: _name,
                          hintText: 'Name',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: _email,
                          hintText: 'E-mail',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: _password,
                          hintText: 'Password',
                        ),
                      ),
                      const CustomButton(
                        text: 'Sign-up',
                      )
                    ],
                  ),
                ),
              ListTile(
                title: const Text('Sign in'),
                leading: Radio(
                  activeColor: globalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                ),
              ),
              if (_auth == Auth.signin)
                Form(
                  key: _signinkey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: _email,
                          hintText: 'E-mail',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextField(
                          controller: _password,
                          hintText: 'Password',
                        ),
                      ),
                      const CustomButton(
                        text: 'Sign-up',
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
