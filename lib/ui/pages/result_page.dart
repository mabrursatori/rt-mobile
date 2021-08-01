part of 'pages.dart';

class ResultPage extends StatelessWidget {
  final String apiURL;

  ResultPage(this.apiURL);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage());
          return;
        },
        child: FutureBuilder(
          future: RecordServices.createRecord(apiURL),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              Record record = snapshot.data;
              List<String> listWaktu = record.waktu.split("T");
              String waktu = listWaktu[1];
              return ListView(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Image.asset("assets/success_icon.png",
                              width: MediaQuery.of(context).size.width -
                                  2 * defaultMargin -
                                  50),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:62,
                                        child: Text(
                                          "Nama",
                                          style: blackTextFont.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Container(
                                        width:62,
                                        child: Text("Jabatan",
                                            style: blackTextFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        width:62,
                                        child: Text("Waktu",
                                            style: blackTextFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Container(
                                        width:62,
                                        child: Text("Status",
                                            style: blackTextFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold)),
                                      )
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
                                      Text(":",
                                          style: blackTextFont.copyWith(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold))
                                    ],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  )
                                ],
                              ),
                              //LABEL

                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                        child: Text(record.nama,
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                            style: blackTextFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                        child: Text(record.jabatan,
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                            style: blackTextFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                        child: Text(waktu,
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                            style: blackTextFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width -
                                                2 * defaultMargin -
                                                50 -
                                                70,
                                        child: Text(record.status,
                                            overflow: TextOverflow.clip,
                                            maxLines: 1,
                                            textAlign: TextAlign.right,
                                            style: blackTextFont.copyWith(
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500)),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              //ISIAN
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                              (record != null)
                                  ? "Selamat Anda Berhasil Absen"
                                  : "Absen Gagal",
                              style: TextStyle(
                                  color: Colors.green[500],
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
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
                    ),
                  )
                ],
              );
            } else {
              return Center(
                  child: SpinKitDualRing(
                color: mainColor,
              ));
            }
          },
        ),
      ),
    );
  }
}
