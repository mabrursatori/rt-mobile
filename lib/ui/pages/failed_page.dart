part of 'pages.dart';

class FailedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
        return;
      },
      child: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/failed_icon.png",
                  width: MediaQuery.of(context).size.width - defaultMargin - 50,
                ),
                Text(
                  "QR Code Tidak Valid !",
                  style: TextStyle(
                      color: Colors.red[500],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Absen Gagal !",
                  style: TextStyle(
                      color: Colors.red[500],
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                RaisedButton(
                    color: Colors.lightBlue,
                    child: Text(
                      "Back To Home",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      context.bloc<PageBloc>().add(GoToMainPage());
                    })
              ],
            ),
          )
        ],
      ),
    ));
  }
}
