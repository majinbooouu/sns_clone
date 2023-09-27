import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sns_clone/authentication/view_models/sign_up_view_model.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeName = "signup";
  static const routeURL = "/signup";
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _email = "";
  String _password = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      setState(() {
        _email = _emailController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        _password = _passwordController.text;
      });
    });
  }

  void _onSubmit() {
    ref.read(signUpForm.notifier).state = {"email": _email};
    final state = ref.read(signUpForm.notifier).state;
    ref.read(signUpForm.notifier).state = {...state, "password": _password};

    // ref.read(signUpForm.notifier).state = {"password": _password};
    ref.read(signUpProvider.notifier).signUp();
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (context) => const PasswordScreen(),
    //   ),
    // );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SIGN UP📝"),
      ),
      body: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 90,
                ),
                Text(
                  "Create MOOD Account",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "MOOD에 계정을 생성하면",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "다양한 혜택이 제공됩니다.",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 25,
                ),
                SizedBox(
                  width: 380,
                  child: TextField(
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    // onEditingComplete: _onSubmit,
                    autocorrect: false,
                    decoration: InputDecoration(
                        enabled: true,
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        prefix: const Padding(
                          padding: EdgeInsets.only(
                            right: 20,
                          ),
                          child: SizedBox(
                            width: 80,
                            child: Center(
                              child: Text(
                                "Email",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        hintText: "이메일을 입력하세요",
                        hintStyle: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 380,
                  child: TextField(
                    textAlignVertical: TextAlignVertical.center,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    controller: _passwordController,
                    keyboardType: TextInputType.emailAddress,
                    // onEditingComplete: _onSubmit,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabled: true,
                      filled: true,
                      fillColor: Colors.grey.shade100,
                      prefix: const Padding(
                        padding: EdgeInsets.only(
                          right: 20,
                        ),
                        child: SizedBox(
                          width: 80,
                          child: Center(
                            child: Text(
                              "Password",
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Colors.transparent,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      hintText: "비밀번호를 입력하세요",
                      hintStyle: const TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: SafeArea(
              child: SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _email.isNotEmpty && _password.isNotEmpty
                            ? _onSubmit
                            : null,
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          // backgroundColor: MaterialStateProperty.all<Color>(
                          //   Colors.grey,
                          // ),
                        ),
                        child: const Text(
                          "🚀",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
