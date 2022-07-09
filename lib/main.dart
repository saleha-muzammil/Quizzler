import 'package:flutter/material.dart';
import 'questions.dart';
import 'quizbank.dart';

void main() => runApp(Quizzler()) ;


class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: basiclayout(),
    );
  }
} class basiclayout extends StatefulWidget {
  const basiclayout({Key? key}) : super(key: key);

  @override
  State<basiclayout> createState() => _basiclayoutState();
}

class _basiclayoutState extends State<basiclayout> {
  List<Widget> results= [];
  int questionno= 0 ;
   quizbank q = quizbank();

  void checkanswer (bool check)
  {
    setState(()
    {
      if (!q.checkcount()) {
        if (check == q.getanswer()) {
          results.add(Icon(Icons.check_circle_outline_rounded, color: Colors.green));
        }
        else {
          results.add(Icon(Icons.cancel_outlined, color: Colors.red,));
        }
        q.incrementquestion();
      }
    }) ;

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quizzler'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      body: Container(
      width: double.infinity ,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
          Colors.deepPurpleAccent ,
          Colors.white
        ])
        ),

      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Container(
                height: 450,
                width: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)) ,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurpleAccent.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: results ,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(
                          height: 20,
                          thickness: 5,
                          indent: 20,
                          endIndent: 0,
                          color: Colors.transparent,
                        ),
                        Container(
                          height: 250,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(q.getquestion(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.deepPurple ,
                            ),
                            ),
                          ),
                        ),
                      ],
                    ) ,
                    const Divider(
                      height: 20,
                      thickness: 5,
                      indent: 20,
                      endIndent: 0,
                      color: Colors.transparent,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Spacer() ,
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                onPressed: (){
                                  checkanswer(true) ;
                                },
                                  style: ButtonStyle
                                    (
                                      backgroundColor: ButtonStyleButton.allOrNull<Color>(Colors.deepPurple),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>
                                        (
                                          RoundedRectangleBorder
                                            (
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.deepPurple)
                                          )
                                      )
                                  ),
                                child: const Text('True' ,
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                )
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                  onPressed: (){
                                    checkanswer(false) ;
                                  },
                                  style: ButtonStyle(
                                      backgroundColor: ButtonStyleButton.allOrNull<Color>(Colors.deepPurple),
                                      shape: MaterialStateProperty.all<RoundedRectangleBorder>
                                        (
                                          RoundedRectangleBorder
                                            (
                                              borderRadius: BorderRadius.circular(18.0),
                                              side: BorderSide(color: Colors.deepPurple)
                                          )
                                      ),
                                  ),
                                  child: const Text('False' ,
                                    style: TextStyle(
                                        color: Colors.white
                                    ),
                                  )
                              ),
                            ),
                            Spacer(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    ),
    );
  }
}
