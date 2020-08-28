import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tictactoe/game.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {


  @override

  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.blue[900],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                  child: Container(
                    child: Text(
                      "TIC TAC TOE",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                  ),
                )
            ),

            Expanded(
              flex: 2,
                child: Container(
                  child: AvatarGlow(
                      endRadius: 150,
                    duration: Duration(seconds: 3),
                    glowColor: Colors.blueAccent,
                    repeat: true,
                    repeatPauseDuration: Duration(seconds: 1),
                    startDelay: Duration(seconds: 1),

                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          style: BorderStyle.none
                        ),
                        shape: BoxShape.circle
                      ),

                      child: CircleAvatar(
                        backgroundColor: Colors.blue[900],
                        child: Container(
                          child: Image.asset(
                            "images/tic-tac-toe.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        radius: 70,
                      ),
                    ),
                  ),
                )
            ),

            Padding(
                padding: const EdgeInsets.only(top: 80.0)
            ),

            GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Game()
                    )
                );
              },
              child: Padding(
                  padding: EdgeInsets.only(left: 40, right: 40, bottom: 60),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    padding: EdgeInsets.all(22),
                    color: Colors.blue[200],
                    child: Center(
                      child: Text(
                        "Jogar",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w900,
                          color: Colors.red
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
