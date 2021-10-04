import 'package:flutter/material.dart';

import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:flutter_testapp/graphql/api.dart';
import 'package:flutter_testapp/state/my_state.dart';
import 'package:flutter_testapp/test_notifier.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/src/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

final formKey = GlobalKey<FormState>();

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;

  @override
  void initState() {
    usernameController = TextEditingController(text: "huan123");
    passwordController = TextEditingController(text: "123");
    super.initState();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<TestNotifier, MyState>(
      create: (context) => TestNotifier(),
      builder: (context, snapshot) {
        //final state = context.watch<LoginPageState>();
        final stateNotifier = context.read<TestNotifier>();

        return Scaffold(
            backgroundColor: Colors.blue.shade600,
            body: Column(
              children: [
                label(),
                nameInput(),
                passInput(),
                forgotText(),
                checkbox(),
                queryView(context),
                orText(),
                icon(),
                signUpText()
              ],
            ));
      },
    );
  }

  Widget nameInput() {
    return baseInput(
      labelText: "User Name",
      controller: usernameController,
      text: "Enter your user name",
      icon: Icon(Icons.mail),
      // validator: (val) {
      //   return userNameValidate(val);
      // },
    );
  }

  Widget queryView(
    BuildContext context,
  ) {
    return Query(
      options: QueryOptions(
        document: gql(
          getUserByName,
        ),
        variables: <String, dynamic>{
          "name": usernameController.text,
          'rocket': passwordController.text,
        },
      ),
      builder: (QueryResult result,
          {VoidCallback? refetch, FetchMore? fetchMore}) {
        if (result.hasException) {
          return btnLogin(text: "ERROR!");
        }

        if (result.isLoading) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        }
        final opts = FetchMoreOptions(
          variables: {
            'name': usernameController.text,
            'rocket': passwordController.text
          },
          updateQuery: (previousResultData, fetchMoreResultData) {
            //  print('previous: ${previousResultData.toString()}');
            // print('now: ${fetchMoreResultData.toString()}');
            return fetchMoreResultData;
          },
        );
        final length = result.data!['users'].length;
        context.read<TestNotifier>().addState(result);
        //  print(context.read<TestNotifier>().notification());
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text(context.read<TestNotifier>().),
        //   ),
        // );
        return Column(
          children: [
            btnLogin(
                text: "Login",
                onPressed: () {
                  print(usernameController.text);
                  fetchMore!(opts);
                  setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(context.read<TestNotifier>().notify),
                    ),
                  );
                }),
            Text(
              length.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }

  Widget checkbox() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 16, 0),
      child: Row(
        children: [
          Theme(
            data: Theme.of(context).copyWith(
              unselectedWidgetColor: Colors.white,
            ),
            child: Checkbox(
              checkColor: Colors.black,
              activeColor: Colors.white,
              hoverColor: Colors.white,
              value: false,
              onChanged: (newValue) {
                //  checkedValue = newValue;
              },
            ),
          ),
          baseText(text: "Remember me", sizeText: 20)
        ],
      ),
    );
  }

  Widget label() {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: baseText(
        text: "Sign In",
        sizeText: 28,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget signUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        baseText(text: "Don't have an Ancount ", sizeText: 20),
        baseText(
          text: "Sign Up",
          sizeText: 20,
          fontWeight: FontWeight.bold,
        )
      ],
    );
  }

  Widget btnLogin({required String text, void Function()? onPressed}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: onPressed,
        shape: const StadiumBorder(),
        color: Colors.white,
        splashColor: Colors.blue[900],
        disabledColor: Colors.grey,
        disabledTextColor: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: baseText(
            text: text,
            fontWeight: FontWeight.bold,
            sizeText: 28,
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }

  Widget forgotText() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 12, 18, 0),
      child: Align(
        alignment: Alignment.centerRight,
        child: baseText(
          text: "Forgot Password?",
          sizeText: 18,
        ),
      ),
    );
  }

  Widget orText() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: baseText(
              text: "- OR - ",
              sizeText: 20,
            ),
          ),
          baseText(
            text: "Sign in with",
            sizeText: 18,
          ),
        ],
      ),
    );
  }

  Widget icon() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(32, 0, 32, 26),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          baseIcon(assetImage: "assets/facebook.png"),
          baseIcon(assetImage: "assets/google.png"),
        ],
      ),
    );
  }

  Widget passInput() {
    return baseInput(
      isShowText: true,
      labelText: "Password",
      controller: passwordController,
      text: "Enter your password",
      icon: Icon(Icons.vpn_key),
      // validator: (val) {
      //   return passwordValidate(val);
      // },
    );
  }

  Widget baseText({
    String? text,
    double? sizeText,
    void Function()? onTap,
    Color color = Colors.white,
    FontWeight fontWeight = FontWeight.normal,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        "$text",
        style: TextStyle(
          color: color,
          fontSize: sizeText,
          fontWeight: fontWeight,
        ),
      ),
    );
  }

  Widget baseIcon({
    String? assetImage,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Container(
        width: 55,
        height: 55,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image(
            image: AssetImage(assetImage!),
            width: 40,
            height: 40,
          ),
        ),
      ),
    );
  }

  Widget baseInput({
    TextEditingController? controller,
    String? labelText,
    String? text,
    Icon? icon,
    bool isShowText = false,
    // String Function(String)? validator,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: baseText(text: labelText, sizeText: 18),
            ),
          ),
          TextFormField(
            controller: controller,
            obscureText: isShowText,
            // validator: validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              filled: true,
              fillColor: Colors.blue.shade300,
              prefixIcon: InkWell(
                // onTap: onTap,

                child: icon,
              ),
              hintText: "$text",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
