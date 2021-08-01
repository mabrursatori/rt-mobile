part of 'pages.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  PageController controller;
  //String timeNow = DateFormat('HH:mm:ss').format(DateTime.now());
  String timeNow = DateFormat('HH:mm:ss').format(DateTime.now());
  bool isToLogin = false;
  void runTimer(BuildContext context) {
    isToLogin = true;
    Timer(Duration(seconds: 15), () {
      if (isToLogin) {
        context.bloc<PageBloc>().add(GoToLoginPage());
      }
    });
  }

  void stopTimer() {
    isToLogin = false;
  }

  @override
  void initState() {
    super.initState();

    Timer(Duration(milliseconds: 999), () {
      Timer.periodic(Duration(seconds: 1), (timer) {
        timeNow = DateFormat('HH:mm:ss').format(DateTime.now());
        setState(() {});
      });
    });
    controller = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: TimeServices.getTime(user.nip),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            timeUser = snapshot.data;
            stopTimer();
            return Stack(
              children: <Widget>[
                Container(
                    margin: EdgeInsets.only(
                      top: 90,
                    ),
                    child: ListView(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 280,
                              height: 90,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 10, color: Colors.amber)),
                              child: Center(
                                child: Text(
                                  timeNow,
                                  style: TextStyle(
                                      fontFamily: 'Digital', fontSize: 80),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            RaisedButton(
                                color: Colors.red,
                                child: Text(
                                  "Logout",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () async {
                                  SessionServices.saveSession("", "");
                                  context.bloc<PageBloc>().add(GoToLoginPage());
                                })
                          ],
                        ),
                      ],
                    )),
                //JAM MASUK DAN KELUAR
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: 370,
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 300,
                            child: Row(
                              children: <Widget>[
                                //JAM MASUK

                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  color: Colors.amber,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/in.png",
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                30,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Check In",
                                          style: blackTextFont.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                        timeUser.jamMasuk ?? "-",
                                        style: blackTextFont.copyWith(
                                            fontSize: 35),
                                      )
                                    ],
                                  ),
                                ),
                                //JAM KELUAR

                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  color: Colors.amber[800],
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      Image.asset(
                                        "assets/out.png",
                                        width:
                                            MediaQuery.of(context).size.width /
                                                    2 -
                                                30,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text("Check Out",
                                          style: blackTextFont.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      Text(timeUser.jamKeluar ?? "-",
                                          style: blackTextFont.copyWith(
                                              fontSize: 35))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )),
                //HEADER
                Container(
                    height: 120,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: accentColor1,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    padding: EdgeInsets.fromLTRB(
                        defaultMargin, 20, defaultMargin, 0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage('assets/account.png')),
                              border: Border.all(
                                  width: 1, color: Colors.blue[900])),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(user.nama,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                            Container(
                              padding: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                  color: Colors.grey[700],
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                              child: Text(user.nip,
                                  style: TextStyle(
                                      fontSize: 10, color: Colors.white)),
                            )
                          ],
                        ),
                      ],
                    ))
              ],
            );
          } else {
            timeUser = Time(
                jamMasuk: "00:00",
                jamKeluar: "00:00",
                status: "tidak terhubung",
                ket: null,
                jumlahData: null);
            runTimer(context);
            return Center(
                child: SpinKitDualRing(
              color: mainColor,
            ));
          }
        });
  }
}
