part of 'pages.dart';

class MainPage extends StatefulWidget {
  final int pageNumber;
  MainPage(this.pageNumber);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavbarIndex;
  PageController pageController;
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
    bottomNavbarIndex = widget.pageNumber;
    pageController = PageController(initialPage: bottomNavbarIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  bottomNavbarIndex = index;
                });
              },
              children: <Widget>[
                //======== DASHBOARD
                FutureBuilder(
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
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  width: 10,
                                                  color: Colors.amber)),
                                          child: Center(
                                            child: Text(
                                              timeNow,
                                              style: TextStyle(
                                                  fontFamily: 'Digital',
                                                  fontSize: 80),
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
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            onPressed: () async {
                                              SessionServices.saveSession(
                                                  "", "");
                                              context
                                                  .bloc<PageBloc>()
                                                  .add(GoToLoginPage());
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              color: Colors.amber,
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    "assets/in.png",
                                                    width:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            30,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("Check In",
                                                      style: blackTextFont
                                                          .copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  Text(
                                                    timeUser.jamMasuk ?? "-",
                                                    style: blackTextFont
                                                        .copyWith(fontSize: 35),
                                                  )
                                                ],
                                              ),
                                            ),
                                            //JAM KELUAR

                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2,
                                              color: Colors.amber[800],
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Image.asset(
                                                    "assets/out.png",
                                                    width:
                                                        MediaQuery.of(context)
                                                                    .size
                                                                    .width /
                                                                2 -
                                                            30,
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text("Check Out",
                                                      style: blackTextFont
                                                          .copyWith(
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                  Text(
                                                      timeUser.jamKeluar ?? "-",
                                                      style: blackTextFont
                                                          .copyWith(
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
                                              image: AssetImage(
                                                  'assets/account.png')),
                                          border: Border.all(
                                              width: 1,
                                              color: Colors.blue[900])),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(3))),
                                          child: Text(user.nip,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white)),
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
                    }),
                //======== SCANPAGE
                ScanPage(),
                //======== REPORTPAGE
                DefaultTabController(
                  length: 2,
                  child: Scaffold(
                    appBar: AppBar(
                      title: Text("Report"),
                      bottom: TabBar(
                        tabs: [
                          Tab(
                            icon: Text("Bulan Ini"),
                          ),
                          Tab(
                            icon: Text("Bulan Kemarin"),
                          )
                        ],
                      ),
                    ),
                    body: TabBarView(
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        //BULAN INI
                        Stack(
                          children: [
                            //HEADER

                            //CONTENT
                            ListView(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(0, 2))
                                      ]),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.date_range),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Tanggal",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("Jam Masuk"),
                                              Text("Telat Masuk"),
                                              Text("Pulang"),
                                              Text("Cepat Pulang"),
                                              Text("Intensif"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(": 20-12-2020",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(": 08:00"),
                                              Text(": 08:00"),
                                              Text(": 08:00"),
                                              Text(": 08:00"),
                                              Text(": 15000"),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                cardReport(tanggal: "10-12-2020", jamMasuk: "08:00", telatMasuk: "19:00",cepatPulang: "08:00", pulang: "16:00", intensif:  "15000"),
                                 cardReport(tanggal: "10-12-2020", jamMasuk: "08:00", telatMasuk: "19:00",cepatPulang: "08:00", pulang: "16:00", intensif:  "15000"),
                                  cardReport(tanggal: "10-12-2020", jamMasuk: "08:00", telatMasuk: "19:00",cepatPulang: "08:00", pulang: "16:00", intensif:  "15000"),
                                   cardReport(tanggal: "10-12-2020", jamMasuk: "08:00", telatMasuk: "19:00",cepatPulang: "08:00", pulang: "16:00", intensif:  "15000"),
                                   SizedBox(height: 70),
                              ],
                            ),
                            Container(
                              color: Colors.amber,
                              height: 100,
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      //LABEL
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text(
                                              "NIP",
                                              style: blackTextFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text("Nama",
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text("Departemen",
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                      //TITIK DUA
                                      Column(
                                        children: [
                                          Text(":",
                                              style: blackTextFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text(":",
                                              style: blackTextFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text(":",
                                              style: blackTextFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  //ISIAN
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                            child: Text(user.nip,
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                            child: Text(user.nama,
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                            child: Text(user.namaCabang,
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  //ISIAN
                                ],
                              ),
                            ),
                          ],
                        ),
                        //BULAN KEMARIN
                        Stack(
                          children: [
                            //HEADER

                            //CONTENT
                            ListView(
                              children: [
                                SizedBox(
                                  height: 100,
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 5),
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 2,
                                            blurRadius: 2,
                                            offset: Offset(0, 2))
                                      ]),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Icon(Icons.date_range),
                                      Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Tanggal",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text("Jam Masuk"),
                                              Text("Telat Masuk"),
                                              Text("Pulang"),
                                              Text("Cepat Pulang"),
                                              Text("Intensif"),
                                            ],
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(": 20-12-2020",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              Text(": 08:00"),
                                              Text(": 08:00"),
                                              Text(": 08:00"),
                                              Text(": 08:00"),
                                              Text(": 15000"),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                cardReport(tanggal: "10-12-2020", jamMasuk: "08:00", telatMasuk: "19:00",cepatPulang: "08:00", pulang: "16:00", intensif:  "15000"),
                                 cardReport(tanggal: "10-12-2020", jamMasuk: "08:00", telatMasuk: "19:00",cepatPulang: "08:00", pulang: "16:00", intensif:  "15000"),
                                  cardReport(tanggal: "10-12-2020", jamMasuk: "08:00", telatMasuk: "19:00",cepatPulang: "08:00", pulang: "16:00", intensif:  "15000"),
                                   cardReport(tanggal: "10-12-2020", jamMasuk: "08:00", telatMasuk: "19:00",cepatPulang: "08:00", pulang: "16:00", intensif:  "15000"),
                                   SizedBox(height: 70),
                              ],
                            ),
                            Container(
                              color: Colors.amber,
                              height: 100,
                              padding: EdgeInsets.all(20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      //LABEL
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 100,
                                            child: Text(
                                              "NIP",
                                              style: blackTextFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text("Nama",
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                          Container(
                                            width: 100,
                                            child: Text("Departemen",
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ],
                                      ),
                                      //TITIK DUA
                                      Column(
                                        children: [
                                          Text(":",
                                              style: blackTextFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text(":",
                                              style: blackTextFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                          Text(":",
                                              style: blackTextFont.copyWith(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 10,
                                      )
                                    ],
                                  ),
                                  //ISIAN
                                  Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                            child: Text(user.nip,
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                            child: Text(user.nama,
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                            child: Text(user.namaCabang,
                                                overflow: TextOverflow.clip,
                                                maxLines: 1,
                                                textAlign: TextAlign.left,
                                                style: blackTextFont.copyWith(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  //ISIAN
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ]),
          createCustomBottomNavbar()
        ],
      ),
    );
  }

  Widget createCustomBottomNavbar() => Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.lightBlue[100],
            currentIndex: bottomNavbarIndex,
            onTap: (index) {
              setState(() {
                bottomNavbarIndex = index;

                pageController.jumpToPage(index);
              });
            },
            items: [
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Icon(Icons.home),
                  ),
                  title: Text("Home",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600))),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Icon(Icons.add_a_photo),
                  ),
                  title: Text("Scan",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600))),
              BottomNavigationBarItem(
                  backgroundColor: Colors.transparent,
                  icon: Container(
                    margin: EdgeInsets.only(bottom: 6),
                    height: 20,
                    child: Icon(Icons.assignment),
                  ),
                  title: Text("Report",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w600))),
              // BottomNavigationBarItem(
              //     icon: Container(
              //       margin: EdgeInsets.only(bottom: 6),
              //       height: 20,
              //       child: Icon(Icons.calendar_today),
              //     ),
              //     title: Text("Ijin",
              //         style: GoogleFonts.raleway(
              //             fontSize: 14, fontWeight: FontWeight.w600)))
            ],
          ),
        ),
      );

  Widget cardReport({String tanggal, String jamMasuk, String telatMasuk,
          String pulang, String cepatPulang, String intensif}) =>
      Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 2,
                  offset: Offset(0, 2))
            ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.date_range),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Tanggal",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Jam Masuk"),
                    Text("Telat Masuk"),
                    Text("Pulang"),
                    Text("Cepat Pulang"),
                    Text("Intensif"),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(": $tanggal",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(": $jamMasuk"),
                    Text(": $telatMasuk"),
                    Text(": $pulang"),
                    Text(": $cepatPulang"),
                    Text(": $intensif"),
                  ],
                )
              ],
            ),
          ],
        ),
      );
}
