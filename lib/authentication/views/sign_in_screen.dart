import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:sns_clone/authentication/view_models/sign_in_view_model.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const routeName = "signin";
  static const routeURL = "/signin";
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
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

  void _onNext() {
    ref.read(loginProvider.notifier).login(
          _email,
          _password,
          context,
        );
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
        title: const Text("🔥MOOD🔥"),
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
                  "Email Login",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "MOOD의 모든 서비스를 이용하기 위해서는",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  "Email로 로그인하십시오.",
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
                GestureDetector(
                  onTap: () {
                    context.push("/signup");
                  },
                  child: Text(
                    "MOOD 계정이 없으십니까?",
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.blue,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                const FaIcon(
                  FontAwesomeIcons.solidHandshake,
                  color: Colors.blue,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                  ),
                  child: Text(
                    "사용자가 Email로 로그인하면, 기기를 교체하거나 복원해야 하는 경우를 대비 하여 자동으로 데이터를 기기에 백업하는 Cloud 백업 등의 MOOD 서비스를 활성 화하기 위해 사용자의 Email 정보가 사용됩니다. 사용자의 기기 일련 번호는 서 비스 제안의 대상 여부를 확인하는 데 사용될 수 있습니다.",
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                )
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
                            ? _onNext
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
                          "Next",
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
