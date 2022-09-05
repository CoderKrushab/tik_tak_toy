import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: tictaktoy(),
  ));
}

class tictaktoy extends StatefulWidget {
  const tictaktoy({Key? key}) : super(key: key);

  @override
  State<tictaktoy> createState() => _tictaktoyState();
}

class _tictaktoyState extends State<tictaktoy> {
  List<String> l = List.filled(9,"");
  List k = List.filled(0, "",growable: true);
  List<Color> c = List.filled(9, Colors.black26);
  String s = "", msg = "", ck = "";
  int temp = 0, cnt = 0, X=0, O=0, b=0, winner=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tik Tak Toy"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  abc(0),
                  abc(1),
                  abc(2),
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  abc(3),
                  abc(4),
                  abc(5),
                ],
              )),
          Expanded(
              child: Row(
                children: [
                  abc(6),
                  abc(7),
                  abc(8),
                ],
              )),
          Expanded(
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.black,
                child: Row(
                  children: [
                    // Expanded(
                    //     child: Container(
                    //       height: 100,
                    //       width: 100,
                    //       color: Colors.black,
                    //       alignment: Alignment.center,
                    //       margin: const EdgeInsets.all(10),
                    //       child: Text(
                    //         msg,
                    //         style: const TextStyle(fontSize: 20, color: Colors.white54),
                    //       ),
                    //     )),
                    Expanded(
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.black,
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(10),
                          child: Text(
                            s,
                            style: const TextStyle(fontSize: 20, color: Colors.white54),
                          ),
                        )),
                    // Expanded(
                    //     child: Container(
                    //       height: 100,
                    //       width: 100,
                    //       color: Colors.black,
                    //       margin: const EdgeInsets.all(10),
                    //       alignment: Alignment.center,
                    //       child: Text(
                    //         ck,
                    //         style: const TextStyle(fontSize: 20, color: Colors.white54),
                    //       ),
                    //     ))
                  ],
                ),
              )), //Text
          Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                        children: [
                          // Expanded(child: Row(
                          //   children: [
                          //     Expanded(child: InkWell(
                          //       onTap: (){
                          //         setState((){
                          //
                          //         });
                          //       },
                          //       child: Container(
                          //         alignment: Alignment.center,
                          //         height: 120,
                          //         width: double.infinity,
                          //         color: Colors.blue,
                          //         margin: EdgeInsets.all(5),
                          //         child: const Text(
                          //           "Redo",
                          //           style: TextStyle(fontSize: 25, color: Colors.black),
                          //         ),
                          //       ),
                          //     )),
                          //   ],
                          // )),//Redo
                          Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    l[0] = "";
                                    l[1] = "";
                                    l[2] = "";
                                    l[3] = "";
                                    l[4] = "";
                                    l[5] = "";
                                    l[6] = "";
                                    l[7] = "";
                                    l[8] = "";
                                    s = "";
                                    msg = "";
                                    ck = "";
                                    k.clear();
                                    cnt = 0;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 120,
                                  width: double.infinity,
                                  color: Colors.blue,
                                  margin: const EdgeInsets.all(5),
                                  child: const Text(
                                    "Reset",
                                    style: TextStyle(fontSize: 25, color: Colors.black),
                                  ),
                                ),
                              )),  //Reset
                          // Expanded(child: Row(
                          //   children: [
                          //     Expanded(child: InkWell(
                          //       onTap: (){
                          //         setState((){
                          //
                          //         });
                          //       },
                          //       child: Container(
                          //         alignment: Alignment.center,
                          //         height: 120,
                          //         width: double.infinity,
                          //         color: Colors.blue,
                          //         margin: const EdgeInsets.all(5),
                          //         child: const Text(
                          //           "Undo",
                          //           style: TextStyle(fontSize: 25, color: Colors.black),
                          //         ),
                          //       ),
                          //     )),
                          //   ],
                          // )),//Undo
                        ],
                      )),
                  // Expanded(child: Row(
                  //   children: [
                  //     Expanded(child: Container(
                  //         alignment: Alignment.centerLeft,
                  //         height: 50,
                  //         width: double.infinity,
                  //         color: Colors.black,
                  //         child: const Text("X is score :- score ",
                  //           style: TextStyle(fontSize: 15,color: Colors.white54),),
                  //     )),
                  //     Expanded(child: Container(
                  //       alignment: Alignment.centerLeft,
                  //       height: 50,
                  //       width: double.infinity,
                  //       color: Colors.black,
                  //       child: const Text("O is score :- score",
                  //         style: TextStyle(fontSize: 15,color: Colors.white54),),
                  //     )),
                  //   ],
                  // )), //Score
                ],
              )),//  score
        ],
      ),
    );
  }

  Widget abc(int i) {
    return Expanded(
        child: InkWell(
          onTap: () {
            if (l[i] == "") {
              if (cnt % 2 == 0) {
                l[i] = "X";
                c[i]=Colors.cyanAccent;
                k.add(i);
                cnt++;
                win();

                if (cnt < 9) {
                  while (k.contains(i) == true) {
                    temp = Random().nextInt(9);
                    i = temp;
                  }
                  if (s != "X is winner") {
                    l[i] = "O";
                    c[i]=Colors.cyan;
                    k.add(i);
                    cnt++;
                  }
                }
              }
            }
            run();
            setState(() {});
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,color: l[i]== ""? Colors.cyanAccent: Colors.cyan,
            ),
            margin: const EdgeInsets.all(5),
            height: 150,
            width: 100,

            //color: Colors.deepOrangeAccent,
            alignment: Alignment.center,
            child: Text(
              l[i],
              style: const TextStyle(fontSize: 50, color: Colors.white),
            ),
          ),
        ));
  }

  win() {
    if (l[0] == "X" && l[1] == "X" && l[2] == "X")
      {
        s = "X is winner";
        c[0]=Colors.cyanAccent; c[1]=Colors.cyanAccent; c[2]=Colors.cyanAccent;
      }
    else if (l[3] == "X" && l[4] == "X" && l[5] == "X" )
      {
        s = "X is winner";
        c[3]=Colors.cyanAccent; c[4]=Colors.cyanAccent; c[5]=Colors.cyanAccent;
      }
    else if(l[6] == "X" && l[7] == "X" && l[8] == "X" )
      {
        s = "X is winner";
        c[6]=Colors.cyanAccent; c[7]=Colors.cyanAccent; c[5]=Colors.cyanAccent;
      }
    else if(l[0] == "X" && l[3] == "X" && l[6] == "X" )
      {
        s = "X is winner";
        c[0]=Colors.cyanAccent; c[3]=Colors.cyanAccent; c[5]=Colors.cyanAccent;
      }
    else if( l[1] == "X" && l[4] == "X" && l[7] == "X" )
      {
        s = "X is winner";
        c[1]=Colors.cyanAccent; c[4]=Colors.cyanAccent; c[7]=Colors.cyanAccent;
      }
    else if( l[2] == "X" && l[5] == "X" && l[8] == "X" )
      {
        s = "X is winner";
        c[2]=Colors.cyanAccent; c[5]=Colors.cyanAccent; c[8]=Colors.cyanAccent;
      }
    else if( l[0] == "X" && l[4] == "X" && l[8] == "X" )
      {
        s = "X is winner";
        c[0]=Colors.cyanAccent; c[4]=Colors.cyanAccent; c[8]=Colors.cyanAccent;
      }
    else if( l[2] == "X" && l[4] == "X" && l[6] == "X")
      {
        s = "X is winner";
        c[2]=Colors.cyanAccent; c[4]=Colors.cyanAccent; c[6]=Colors.cyanAccent;
      }
    if (l[0] == "O" && l[1] == "O" && l[2] == "O")
    {
      s = "O is winner";
      c[0]=Colors.cyan; c[1]=Colors.cyan; c[2]=Colors.cyan;
    }
    else if (l[3] == "O" && l[4] == "O" && l[5] == "O" )
    {
      s = "O is winner";
      c[3]=Colors.cyan; c[4]=Colors.cyan; c[5]=Colors.cyan;
    }
    else if(l[6] == "O" && l[7] == "O" && l[8] == "O" )
    {
      s = "O is winner";
      c[6]=Colors.cyan; c[7]=Colors.cyan; c[8]=Colors.cyan;
    }
    else if(l[0] == "O" && l[3] == "O" && l[6] == "O" )
    {
      s = "O is winner";
      c[0]=Colors.cyan; c[3]=Colors.cyan; c[6]=Colors.cyan;
    }
    else if( l[1] == "O" && l[4] == "O" && l[7] == "O" )
    {
      s = "O is winner";
      c[1]=Colors.cyan; c[4]=Colors.cyan; c[7]=Colors.cyan;
    }
    else if( l[2] == "O" && l[5] == "O" && l[8] == "O" )
    {
      s = "O is winner";
      c[2]=Colors.cyan; c[5]=Colors.cyan; c[8]=Colors.cyan;
    }
    else if( l[0] == "O" && l[4] == "O" && l[8] == "O" )
    {
      s = "O is winner";
      c[0]=Colors.cyan; c[4]=Colors.cyan; c[8]=Colors.cyan;
    }
    else if( l[2] == "O" && l[4] == "O" && l[6] == "O")
    {
      s = "O is winner";
      c[2]=Colors.cyan; c[4]=Colors.cyan; c[6]=Colors.cyan;
    }
  }

  run() {
    if (l[0] == "" ||
        l[1] == "" ||
        l[2] == "" ||
        l[3] == "" ||
        l[4] == "" ||
        l[5] == "" ||
        l[6] == "" ||
        l[7] == "" ||
        l[8] == "") {
      msg = "Game is running...";
    } else if (l[0] != "" &&
        l[1] != "" &&
        l[2] != "" &&
        l[3] != "" &&
        l[4] != "" &&
        l[5] != "" &&
        l[6] != "" &&
        l[7] != "" &&
        l[8] != "") {
      msg = "Game is stop...";
    }
  }
}