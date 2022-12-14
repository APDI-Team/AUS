import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/popup_dialog.dart';
import '../../firebase_login_state.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  LoginPageWidgetState createState() => LoginPageWidgetState();
}

class LoginPageWidgetState extends State<LoginPageWidget> {
  TextEditingController? emailTextController;
  TextEditingController? passwordTextController;

  late bool passwordVisibility;
  late bool isSignup;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    emailTextController = TextEditingController();
    passwordTextController = TextEditingController();
    passwordVisibility = false;
    isSignup = false;
  }

  @override
  void dispose() {
    emailTextController?.dispose();
    passwordTextController?.dispose();
    super.dispose();
  }

  void loginOrSignup(LoginState appState) {
    if (!isSignup) {
      // do login
      appState
          .signInWithEmailAndPassword(
              emailTextController!.text, passwordTextController!.text)
          .then((registerState) {
        switch (registerState) {
          case RegisterState.emailVerified:
            Navigator.pushNamed(context, 'welcome');
            break;
          case RegisterState.setupComplete:
            Navigator.pushNamed(context, 'welcome');
            break;
          default:
            throw Exception("This should not happen: "
                "the signInWithEmailAndPassword function "
                "should've thrown another exception");
        }
      }).catchError((error) {
        popUpDialog(context, 'Login Failed', error.message);
      });
    } else {
      // do register
      appState
          .registerAccount(
              emailTextController!.text, passwordTextController!.text)
          .then((value) {
        Navigator.pushNamed(context, 'verify');
        setState(() {
          isSignup = false;
        });
      }).catchError((error) {
        popUpDialog(context, 'Sign Up Failed', error.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0,
      ),
      body: SafeArea(
        child: Visibility(
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 44, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      InkWell(
                        onTap: () => setState(() {
                          isSignup = false;
                        }),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 0, 16, 0),
                            child: Text(
                              'Sign In',
                              style: isSignup
                                  ? Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: Colors.grey)
                                  : Theme.of(context).textTheme.titleLarge,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => setState(() {
                          isSignup = true;
                        }),
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          alignment: const AlignmentDirectional(-1, 0),
                          child: Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16, 0, 16, 0),
                            child: Text(
                              'Sign Up',
                              style: isSignup
                                  ? Theme.of(context).textTheme.titleLarge
                                  : Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Use the form below, to access your account.',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6,
                          color: Color(0x3416202A),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: TextFormField(
                        controller: emailTextController,
                        obscureText: false,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          labelText: 'Your email address',
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20, 24, 20, 24),
                        ),
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      boxShadow: const [
                        BoxShadow(
                          blurRadius: 6,
                          color: Color(0x3416202A),
                          offset: Offset(0, 2),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(2, 2, 2, 2),
                      child: TextFormField(
                        controller: passwordTextController,
                        obscureText: !passwordVisibility,
                        autocorrect: false,
                        enableSuggestions: false,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: Theme.of(context).textTheme.bodyText2,
                          hintStyle: Theme.of(context).textTheme.bodyText2,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0x00000000),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          filled: true,
                          fillColor: Theme.of(context).cardColor,
                          contentPadding: const EdgeInsetsDirectional.fromSTEB(
                              20, 24, 20, 24),
                          suffixIcon: InkWell(
                            onTap: () => setState(
                              () => passwordVisibility = !passwordVisibility,
                            ),
                            focusNode: FocusNode(skipTraversal: true),
                            child: Icon(
                              passwordVisibility
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: const Color(0xFF757575),
                              size: 22,
                            ),
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 1,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'password_reset');
                        },
                        style: TextButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          elevation: 0,
                          side: const BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                        ),
                        child: const SizedBox(
                          width: 150,
                          height: 50,
                          child: Center(
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Consumer<LoginState>(builder: (context, appState, _) {
                        return TextButton(
                          onPressed: () => loginOrSignup(appState),
                          style: TextButton.styleFrom(
                            primary: Theme.of(context).primaryColor,
                            backgroundColor:
                                Theme.of(context).colorScheme.secondary,
                            elevation: 3,
                            side: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                          ),
                          child: SizedBox(
                            width: 150,
                            height: 50,
                            child: Center(
                              child: Text(
                                isSignup ? 'Sign Up' : 'Login',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
