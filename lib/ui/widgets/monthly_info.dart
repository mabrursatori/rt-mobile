part of 'widgets.dart';

enum Status { toLeft, toRight }

class MonthlyInfo extends StatelessWidget {
  final String month;
  final String toMonth;
  final Status status;
  final List<String> labels;
  final List<String> values;
  final List<Color> colors;

  MonthlyInfo(
      {@required this.month,
      @required this.toMonth,
      @required this.status,
      @required this.labels,
      @required this.values,
      @required this.colors});
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 10, right: 10),
            child: (status == Status.toRight)
                ? rowToRight(toMonth)
                : rowToLeft(toMonth)),
        CardInfo(
            color: colors[0],
            txtLabel: labels[0],
            txtMonth: month,
            txtValue: values[0]),
        CardInfo(
            color: colors[1],
            txtLabel: labels[1],
            txtMonth: month,
            txtValue: values[1]),
        CardInfo(
            color: colors[2],
            txtLabel: labels[2],
            txtMonth: month,
            txtValue: values[2]),
        CardInfo(
            color: colors[3],
            txtLabel: labels[3],
            txtMonth: month,
            txtValue: values[3]),
        CardInfo(
            color: colors[4],
            txtLabel: labels[4],
            txtMonth: month,
            txtValue: values[4])
      ],
    ));
  }

  Widget rowToRight(String toMonth) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Text(
            toMonth,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.arrow_forward,
            size: 30,
          )
        ],
      );

  Widget rowToLeft(String toMonth) => Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.arrow_back,
            size: 30,
          ),
          Text(
            toMonth,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ],
      );
}
