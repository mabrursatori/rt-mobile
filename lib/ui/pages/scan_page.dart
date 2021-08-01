part of 'pages.dart';

class ScanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/qr_icon.gif",
                width: MediaQuery.of(context).size.width,
              ),
              RaisedButton(
                color: Colors.lightBlue,
                onPressed: (){
                  if (ipPublic != "203.210.85.36") {
                    Flushbar(
                      duration: Duration(seconds: 4),
                      flushbarPosition: FlushbarPosition.TOP,
                      backgroundColor: Color(0xFFFF5C83),
                      message: "Anda berada diluar jangkauan absen!!",
                    )..show(context);
                  } else {
                    context.bloc<PageBloc>().add(GoToQrPage());
                  }
                },
                child: Text(
                  "Scan",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
