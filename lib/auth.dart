import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool logtab = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(
        backgroundColor: themeData.colorScheme.surface,
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 120,
              ),
              Container(
                  child: logtab
                      ? _login(
                          themeData: themeData,
                          setter: (bool bool) {
                            setState(() {
                              logtab = bool;
                            });
                          },
                        )
                      : _signup(
                          themeData: themeData,
                          setter: (bool bool) {
                            setState(() {
                              logtab = bool;
                            });
                          },
                        ))
            ],
          ),
        ));
  }
}

typedef Setbool = void Function(bool bool);

class _login extends StatelessWidget {
  @override
  const _login({
    Key? key,
    required this.themeData,
    required this.setter,
  }) : super(key: key);
  final ThemeData themeData;
  final Setbool setter;

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: themeData.colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
          child: SingleChildScrollView(
            child: Column(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.signInTitle,
                    style: themeData.textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppLocalizations.of(context)!.signInSubtitle,
                    style: themeData.textTheme.titleLarge!
                        .apply(fontSizeFactor: 0.7),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          label: Text(
                        AppLocalizations.of(context)!.username,
                        style: themeData.textTheme.labelLarge,
                      )),
                      style: themeData.textTheme.titleLarge!
                          .apply(fontSizeFactor: 0.8)),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(
                      child: _passwordTextField(themeData: themeData),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            minimumSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width, 60))),
                        child: Text(
                          AppLocalizations.of(context)!.loginButton,
                          style:
                              TextStyle(color: themeData.colorScheme.onPrimary),
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.forget,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.reset,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: TextStyle(letterSpacing: 2),
                      ),
                      Expanded(child: Divider())
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/img/icons/google.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/img/icons/facebook.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/img/icons/twitter.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.dont,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setter(false);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signUpNavigate,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _signup extends StatelessWidget {
  @override
  const _signup({
    Key? key,
    required this.themeData,
    required this.setter,
  }) : super(key: key);
  final ThemeData themeData;
  final Setbool setter;

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: themeData.colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppLocalizations.of(context)!.signUpTitle,
                    style: themeData.textTheme.displaySmall,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    AppLocalizations.of(context)!.signUpSubtitle,
                    style: themeData.textTheme.titleLarge!
                        .apply(fontSizeFactor: 0.7),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  TextField(
                      decoration: InputDecoration(
                          label: Text(
                        AppLocalizations.of(context)!.email,
                        style: themeData.textTheme.labelLarge,
                      )),
                      style: themeData.textTheme.titleLarge!
                          .apply(fontSizeFactor: 0.8)),
                  TextField(
                      decoration: InputDecoration(
                          label: Text(AppLocalizations.of(context)!.phone,
                              style: themeData.textTheme.labelLarge)),
                      style: themeData.textTheme.titleLarge!
                          .apply(fontSizeFactor: 0.8)),
                  TextField(
                      decoration: InputDecoration(
                          label: Text(AppLocalizations.of(context)!.username,
                              style: themeData.textTheme.labelLarge)),
                      style: themeData.textTheme.titleLarge!
                          .apply(fontSizeFactor: 0.8)),
                  const SizedBox(height: 8),
                  Row(children: [
                    Expanded(
                      child: _passwordTextField(themeData: themeData),
                    )
                  ]),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 32, 0, 16),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            minimumSize: MaterialStateProperty.all(
                                Size(MediaQuery.of(context).size.width, 60))),
                        child: Text(AppLocalizations.of(context)!.signUpButton,
                            style: TextStyle(
                                color: themeData.colorScheme.onPrimary))),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text(
                        AppLocalizations.of(context)!.or,
                        style: TextStyle(letterSpacing: 2),
                      ),
                      Expanded(child: Divider())
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/img/icons/google.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/img/icons/facebook.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Image.asset(
                          'assets/img/icons/twitter.png',
                          width: 36,
                          height: 36,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.already,
                    style: TextStyle(
                      fontSize: 14,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        setter(true);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.signInNavigate,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ))
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class _passwordTextField extends StatefulWidget {
  const _passwordTextField({
    super.key,
    required this.themeData,
  });

  final ThemeData themeData;

  @override
  State<_passwordTextField> createState() =>
      _passwordTextFieldState(themeData: themeData);
}

class _passwordTextFieldState extends State<_passwordTextField> {
  bool obscureText = true;
  final ThemeData themeData;

  _passwordTextFieldState({required this.themeData});

  @override
  Widget build(
    BuildContext context,
  ) {
    return TextField(
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      style: widget.themeData.textTheme.titleLarge!.apply(fontSizeFactor: 0.8),
      decoration: InputDecoration(
          label: Text(AppLocalizations.of(context)!.password, style: themeData.textTheme.labelLarge),
          suffixIcon: TextButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            child: Text(
              obscureText ? AppLocalizations.of(context)!.show : AppLocalizations.of(context)!.hide,
              style: const TextStyle(fontSize: 14),
            ),
          )),
    );
  }
}
