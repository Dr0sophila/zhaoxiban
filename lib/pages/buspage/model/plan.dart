import 'package:flutter/material.dart';

class Plan extends StatelessWidget {
  Plan({Key key, this.data}) : super(key: key);
  Map<String, dynamic> data;
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                  "约${(int.parse(data["duration"])) ~/ 60}分钟",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data["segments"].length - 1,
                    itemBuilder: (context, count) {
                      print("buslines:");
                      print(data["segments"][count]["bus"]["buslines"][0]
                          ["name"]);
                      return busbar(
                        name: data["segments"][count]["bus"]["buslines"][0]
                            ["name"],
                        Arrival: data["segments"][count]["bus"]["buslines"][0]
                            ["arrival_stop"]["name"],
                        departure: data["segments"][count]["bus"]["buslines"][0]
                            ["departure_stop"]["name"],
                      );
                    }),
              ],
            )));
  }
}

class busbar extends StatelessWidget {
  busbar({Key key, this.name, this.duration, this.Arrival, this.departure})
      : super(key: key);
  String name;
  String duration;
  String Arrival;
  String departure;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          name.split("(")[0],
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: Colors.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "上站：",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          departure,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          "到站：",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 13.0, color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          Arrival,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.black),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Divider(
          height: 1,
          color: Colors.grey,
        )
      ],
    );
  }
}
