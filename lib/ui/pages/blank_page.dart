part of 'pages.dart';


class BlankPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: SpinKitDualRing(
              color: mainColor,
            ),),
    );
  }
}
