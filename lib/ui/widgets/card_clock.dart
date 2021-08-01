part of 'widgets.dart';

class CardClock extends StatelessWidget {
  final String title;
  final String jam;
  final Color color;
  final double width;

  CardClock(
      {@required this.title,
      @required this.jam,
      @required this.color,
      @required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(1.0, 1.0), //(x,y)
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 30,
                width: width,
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.3)),
                child: Center(
                  child: Text(title,
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            Container(
              height: 100,
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.access_time,
                    color: Colors.white,
                    size: 30,
                  ),
                  Text(
                    jam,
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
