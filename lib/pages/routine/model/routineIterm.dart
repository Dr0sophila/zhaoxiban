import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zhaoxiban/pages/routine/provider/routineProvider.dart';

int index_1;
int nowKey=3;
class RoutineIterm extends StatefulWidget {
  @override
  createState() {
    return  RoutineItermState();
  }
}

class RoutineItermState extends State<RoutineIterm> {
  @override
  Widget build(BuildContext context) {
    return  Container(
        height: MediaQuery.of(context).size.height *0.67,
        width: MediaQuery.of(context).size.width *0.98,
        margin: const EdgeInsets.only(top: 20.0,bottom: 20.0),
        child: Consumer<RoutineList>(
            builder: (context, funcRoutine, child) {
              if(null !=funcRoutine.schedule)
              {
                for(String item in funcRoutine.schedule){
                  routineData[item][0]=true;
                 }
                }
              if(null !=funcRoutine.delete) {
                for (String item in funcRoutine.delete) {
                  routineData.remove(item);
                  routineKey.remove(item);
                }
              }
              return ListView.builder(
                itemCount: routineData.length,
                itemBuilder: (BuildContext context, int index) {
                  index_1=index;
                return  Container(
                    height: MediaQuery.of(context).size.height *0.67*0.3,
                    width: MediaQuery.of(context).size.width *0.98,
                    margin:const EdgeInsets.only(left: 10.0,bottom:10.0,right:10.0 ),
                    alignment: Alignment.center,
                    decoration:const  BoxDecoration(
                      color: Color.fromRGBO(255, 255, 255, 1.0),
                      borderRadius: BorderRadius.all( Radius.circular(30.0)),
                    ),
                    child:  Stack(
                        children: [
                          Positioned(
                            left: 30,
                            child: Row(
                                children: [
                                  Text(
                                      routineData[routineKey[index]][3],
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                          color:Color.fromRGBO(0, 0, 0, 1.0),
                                          fontWeight: FontWeight.w900,
                                          fontSize: 42.0,
                                          fontFamily: 'SHS'
                                      )
                                  ),
                                  Container(
                                    margin:const EdgeInsets.only(left: 20 ),
                                    child: Image(
                                      image:
                                      routineData[routineKey[index]][1]?AssetImage("assets/img/routine_am.png"):AssetImage("assets/img/routine_pm.png"),
                                      height: 60.0,
                                      width: 50.0,
                                    ),
                                  ),
                                  Container(
                                      width: (MediaQuery.of (context). size .width) / 2,
                                      child: MaterialButton(
                                        onPressed: (){
                                          setState(() {
                                            routineData[routineKey[index]][0]=!routineData[routineKey[index]][0];
                                            if( routineData[routineKey[index]][0]==true){
                                              funcRoutine.getSchedule(routineKey[index]);
                                            }else{
                                              funcRoutine.moveSchedule(routineKey[index]);
                                            }

                                          });
                                        },
                                        child:Image(
                                          image:
                                          routineData[routineKey[index]][0]==true?AssetImage("assets/img/routine_open.png") :AssetImage("assets/img/routine_close.png"),
                                          height: 120.0,
                                          width: 90.0,
                                        ),

                                      )

                                  )
                                ]
                            ),
                          ),
                          Positioned(
                            top: 85,
                            left: 30,
                            child: Text(
                                routineData[routineKey[index]][2],
                                textAlign: TextAlign.left,
                                style: const TextStyle(
                                    color:Color.fromRGBO(0, 0, 0, 1.0),
                                    fontWeight: FontWeight.w900,
                                    fontSize: 35.0,
                                    fontFamily: 'SHS'
                                )
                            ),
                          ),
                        ]
                    )
                );

                },
              );
            }
        ));
  }
}

List<String>routineKey=["0","1","2"];
Map routineData={
  "0":[false, true, '练习普通话', '5:50','每次','默认'],//0：是否被选择；1：是否是早上
  "1":[false, true, '吃早饭', '6:30','每次','默认'],
  "2":[false, false, '吃药', '8:00','每次','默认'],
};