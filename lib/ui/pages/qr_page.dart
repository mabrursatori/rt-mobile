part of 'pages.dart';

class QrPage extends StatefulWidget {
  @override
  _QrPageState createState() => _QrPageState();
}

class _QrPageState extends State<QrPage> {
  final GlobalKey qrKey = GlobalKey();
  String apiURL;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          context.bloc<PageBloc>().add(GoToMainPage(pageNumber: 1));
          return;
        },
        child: Column(
          children: [
            Flexible(
                flex: 3,
                child: QRView(
                        
                        key: qrKey,
                        onQRViewCreated: (controller) {
                          controller.scannedDataStream.listen((value) {
                            apiURL = value;
                            setState(() {
                              if (apiURL == null) {
                              } else if (apiURL !=
                                  "http://192.168.1.2:8080/apiweb/absen.aspx?pin=mabrur&id=") {
                                context.bloc<PageBloc>().add(GoToFailedPage());
                              } else {
                                List<String> listURL = apiURL.split("mabrur");
                                listURL.insert(1, user.pin);
                                listURL.add("Mabrur");
                                apiURL = listURL.join();

                                context.bloc<PageBloc>().add(GoToResultPage(apiURL));
                              }
                            });
                          });
                        },
                      ),),
            Flexible(
                flex: 1,
                child: Center(
                  child: SpinKitPouringHourglass(
                    color: Colors.blue,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
