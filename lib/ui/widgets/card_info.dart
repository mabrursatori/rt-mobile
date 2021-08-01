part of 'widgets.dart';

class CardInfo extends StatelessWidget {
  final Color color;
  final String txtLabel;
  final String txtMonth;
  final String txtValue;

  CardInfo(
      {@required this.color,
      @required this.txtLabel,
      @required this.txtMonth,
      @required this.txtValue});
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 20;
    return Container(
      width: width,
      height: 70,
      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(1.0, 1.0), //(x,y)
            blurRadius: 1.0,
          ),
        ],
      ),
      child: Container(
        width: width - 10,
        margin: EdgeInsets.only(left: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Text(
                  txtLabel,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 3,
                ),
                Text(
                  txtMonth,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                )
              ],
            ),
            Text(
              txtValue,
              style: TextStyle(
                  color: color, fontSize: 50, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
