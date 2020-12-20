import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          debugShowCheckedModeBanner: false,
          home:Scaffold(

            appBar: AppBar(
                title: Text("Quiz App"),
                backgroundColor: Colors.deepPurple,
              ),
              body:QuizApp(),
          ),
    );
  }
}


class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  Map<int,Map<String,dynamic>> quizLists = {
      1:{
          "q":"ไอยู / IU มาจากภาษาอังกฤษ I and You(ฉันและเธอ) ?",
          "a":true
      },
      2:{
        "q":"W Two Worlds เป็นผลงานของ ไอยู ?",
        "a":false
      },
      3:{
        "q":"ไอยู เกิดวันที่ 16 พฤษภาคม 1993 ?",
        "a":true
      },
      4:{
        "q":"สถานที่เกิดของไอยู คือ โซล , เกาหลีใต้ ?",
        "a":true
      },
      5:{
        "q":"While You Were Sleeping คือผลงานของไอยู ?",
        "a":false
      },
      6:{
        "q":"W Two Worlds เป็นผลงานของ IU ?",
        "a":false
      },
      7:{
        "q":"กรุ๊ปเลือดของไอยู คือ A?",
        "a":true
      },
      8:{
        "q":"Real+ เป็นผลงานของ ไอยู ?",
        "a":true
      },
      9:{
        "q":"A Flower Bookmark เป็นผลงานของ ไอยู ?",
        "a":true
      },
      10:{
        "q":"Jade lover เป็นผลงานของ ไอยู ?",
        "a":false
      },
      11:{
        "q":"Gogh, The Starry Night เป็นผลงานของ ไอยู ?",
        "a":false
      },
      12:{
        "q":"Spring of a Twenty Year Old เป็นผลงานของ ไอยู ?",
        "a":true
      },
      13:{
        "q":"Pinocchio เป็นผลงานของ ไอยู ?",
        "a":false
      },
      14:{
        "q":"Doctor Stranger เป็นผลงานของ ไอยู ?",
        "a":false
      },
      15:{
        "q":"New World เป็นผลงานของ ไอยู ?",
        "a":true
      },
      16:{
        "q":"I Hear Your Voice เป็นผลงานของ ไอยู ?",
        "a":false
      },
      17:{
        "q":"School 2013 คือผลงานของ ไอยู?",
        "a":false
      },
      18:{
        "q":"Modern Times คือผลงานของ ไอยู ?",
        "a":true
      },
      19:{
        "q":"Secret Garden คือผลงานของ ไอยู ?",
        "a":false
      },
      20:{
        "q":"You and I คือผลงานของ ไอยู ?",
        "a":true
      },


  };

  int score = 0;
  int quizNumber = 1;

  void submit(bool answer){

    if(quizLists[quizNumber]["a"]  == answer){
      score+=1;
    }

    if(quizNumber == quizLists.length){
      showDialog(
          context: context,
          barrierDismissible:false,
          builder: (BuildContext context){
            return AlertDialog(
              title: Text("Congratulations !!"),
              content: Text("Your Score is $score out of ${quizLists.length}"),
              actions: [
                FlatButton(
                  textColor: Colors.teal,
                  child: Text("Restart Quiz App "),
                  onPressed: (){
                    setState(() {
                      quizNumber = 1;
                      score = 0;
                    });
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          }
      );
    }else{
      setState(() {
        quizNumber += 1;
      });
    }


  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:Center(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                        "${quizLists[quizNumber]["q"]}",
                      style: TextStyle(
                        fontSize:15,
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),

                Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 70,
                          color: Colors.green,
                          child: IconButton(

                            icon:Icon(Icons.check,color: Colors.white,),
                            onPressed: (){
                              submit(true);
                            },
                            //ปรับให้ icon ไม่มีเอฟเฟก
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                          ),
                        ),
                      ),

                      Expanded(
                        child: Container(
                          height: 70,
                          color:Colors.red,
                          child: IconButton(
                            icon:Icon(Icons.close,color:Colors.white),
                            onPressed: (){
                              submit(false);
                            },
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
      ),
            ),
          ),
        )
    );
  }
}
