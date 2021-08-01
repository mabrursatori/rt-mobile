part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isSigningIn = false;
  bool isHash = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(defaultMargin, 0, defaultMargin, 0),
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - 150,
                  child: Image.asset("assets/logo_full_rekabio.gif"),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField(
                    onChanged: null,
                    controller: usernameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Username",
                        hintText: "Username")),
                SizedBox(
                  height: 20,
                ),
                TextField(
                    onChanged: null,
                    controller: passwordController,
                    obscureText: isHash,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.remove_red_eye),
                          color: (isHash) ? Colors.grey : Colors.black,
                          onPressed: () {
                            isHash = !isHash;
                            setState(() {});
                          },
                        ),
                        labelText: "Password",
                        hintText: "Password")),
                SizedBox(
                  height: 10,
                ),
                isSigningIn
                    ? SpinKitFadingCircle(
                        color: mainColor,
                      )
                    : RaisedButton(
                        onPressed: () async {
                          // context.bloc<PageBloc>().add(GoToMainPage());

                          if (usernameController.text == "" &&
                              passwordController.text == "") {
                            Flushbar(
                              duration: Duration(seconds: 4),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Harap isi Username dan Password",
                            )..show(context);
                          } else if (usernameController.text == "") {
                            Flushbar(
                              duration: Duration(seconds: 4),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Harap isi Username",
                            )..show(context);
                          } else if (passwordController.text == "") {
                            Flushbar(
                              duration: Duration(seconds: 4),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: "Harap isi Password",
                            )..show(context);
                          } else {
                            setState(() {
                              isSigningIn = true;
                            });
                            ipPublic = await IpServices.getPublicIP();
                            user = await UserServices.getUser(
                                usernameController.text,
                                passwordController.text);

                            if (user == null) {
                              setState(() {
                                isSigningIn = false;
                              });
                              Flushbar(
                                duration: Duration(seconds: 4),
                                flushbarPosition: FlushbarPosition.TOP,
                                backgroundColor: Color(0xFFFF5C83),
                                message: "Username atau Password salah!!",
                              )..show(context);
                            } else {
                              SessionServices.saveSession(
                                  usernameController.text,
                                  passwordController.text);
                              context.bloc<PageBloc>().add(GoToMainPage());
                            }
                          }
                        },
                        color: Colors.lightBlue,
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.white),
                        ),
                      )
              ],
            ),
          ),
        ));
  }
}
