import 'package:flutter/material.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {

  //Definir Pontuação Jogadores
  int xScore = 0;
  int oScore = 0;

//Link das images
  bool isCross = true;
  String message;
  List<String> gameState;

  AssetImage ironMan = AssetImage("images/ironMan.png");
  AssetImage captain_america = AssetImage("images/captain_america.png");
  AssetImage edit = AssetImage("images/edit.png");

  //Começa com os quadros vazios
  @override
  void initState() {
    super.initState();
    setState(() {
      this.message = "";
      this.gameState = [
        'empty','empty','empty',
        'empty','empty','empty',
        'empty','empty','empty'
      ];
    });
  }

  //Método playGame
  playGame(int index){
    if(this.gameState[index]=="empty"){
      setState(() {
        if(this.isCross){
          this.gameState[index] = "ironMan";
        }else{
          this.gameState[index] = "captain_america";
        }
        this.isCross = !this.isCross;
        this.checkWinner();
      });
    }
  }
  //Método Reset Jogo
  resetGame(){
    setState(() {
      this.message = "";
      this.gameState = [
        'empty','empty','empty',
        'empty','empty','empty',
        'empty','empty','empty'
      ];
    });
  }

  //Método Reset Score
  resetScore(){
    setState(() {
      this.xScore = 0;
      this.oScore = 0;
      this.message = "";
      this.gameState = [
        'empty','empty','empty',
        'empty','empty','empty',
        'empty','empty','empty'
      ];
    });
  }

  //Método Recuperar Imagem para o jogo
  AssetImage getImage(String value){
    switch(value){
      case("empty"):
        return edit;
        break;
      case("ironMan"):
        return ironMan;
        break;
      case("captain_america"):
        return captain_america;
        break;
    }
  }

  //Método Vencedor
  checkWinner(){
    if( (gameState[0]!="empty") && gameState[1]==gameState[0] &&
        gameState[1]==gameState[2] ){
      setState(() {
        this.message = "${gameState[0]} Ganhou";
        _showWinDialog(gameState[0]);

      });

    }else if( (gameState[0]!="empty") && gameState[0]==gameState[3] &&
        gameState[3]==gameState[6] ){
      setState(() {
        this.message = "${gameState[0]} Ganhou";
        _showWinDialog(gameState[3]);
      });

    }else if( (gameState[1]!="empty") && gameState[4]==gameState[1] &&
        gameState[7]==gameState[4] ){
      setState(() {
        this.message = "${gameState[1]} Ganhou";
        _showWinDialog(gameState[1]);
      });

    }else if( (gameState[2]!="empty") && gameState[5]==gameState[2] &&
        gameState[5]==gameState[8] ){
      setState(() {
        this.message = "${gameState[2]} Ganhou";
        _showWinDialog(gameState[2]);
      });

    }else if( (gameState[3]!="empty") && gameState[4]==gameState[3] &&
        gameState[5]==gameState[4] ){
      setState(() {
        this.message = "${gameState[3]} Ganhou";
        _showWinDialog(gameState[4]);
      });


    }else if( (gameState[6]!="empty") && gameState[6]==gameState[7] &&
        gameState[7]==gameState[8] ){
      setState(() {
        this.message = "${gameState[6]} Ganhou.";
        _showWinDialog(gameState[6]);
      });


    }else if( (gameState[0]!="empty") && gameState[4]==gameState[0] &&
        gameState[8]==gameState[4] ){
      setState(() {
        this.message = "${gameState[0]} Ganhou";
        _showWinDialog(gameState[8]);
      });


    }else if( (gameState[2]!="empty") && gameState[2]==gameState[4] &&
        gameState[4]==gameState[6] ){
      setState(() {
        this.message = "${gameState[2]} Ganhou";
        _showWinDialog(gameState[2]);
      });

    }else if(!gameState.contains("empty")){

      setState(() {
        this.message = "Empate";
        _showDrawDialog();
      });


    }

  }

  //-----------

  //Quando há empate
  void _showDrawDialog(){
    showDialog(
        barrierDismissible: false, // Para nao clicar fora para sair do jogo
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Empate",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: RaisedButton.icon(
                    onPressed: (){
                      resetGame();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.refresh),
                    label: Text(
                        "Jogar Novamente",
                      textAlign: TextAlign.center,
                    )
                ),
              ),

              Center(
                child: RaisedButton.icon(
                    onPressed: (){
                      resetScore();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.autorenew),
                    label: Text(
                        "Limpar Pontuação",
                      textAlign: TextAlign.center,
                    )
                ),
              )
            ],
          );
        });
  }


  //Método popup Vencedor

  void _showWinDialog(String _winner) {
    showDialog(
        barrierDismissible: false, // Para nao clicar fora para sair do jogo
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "$_winner Ganhou!",
              textAlign: TextAlign.center,
            ),
            actions: <Widget>[
              Center(
                child: RaisedButton.icon(
                    onPressed: (){
                      resetGame();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.refresh),
                    label: Text(
                        "Jogar Novamente",
                      textAlign: TextAlign.center,
                    )
                ),
              ),

              Center(
                child: RaisedButton.icon(
                    onPressed: (){
                      resetScore();
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.autorenew),
                    label: Text(
                        "Limpar Pontuação",
                      textAlign: TextAlign.center,
                    ),
                ),
              )
            ],
          );
        });

    //Adicionar pontuação aos jogadores
    if (_winner == "captain_america"){
      oScore += 1;
    }else if(_winner == "ironMan"){
      xScore += 1;
    }
  }

  //============

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[

          Expanded(
            child: Container(
              child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(55, 5, 55, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 40)),
                            Image.asset(
                              "images/iron.png", width: 70,
                            ),
                            //Pontuação
                            Text(
                              xScore.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17
                              ),
                            ),

                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(55, 5, 55, 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(top: 40)),
                            Image.asset(
                              "images/captain.png", width: 70,
                            ),

                            //Pontuação
                            Text(
                              oScore.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
              ),
            ),
          ),

          //Expanded é usado pra tela Full Screen nos dispositivo, independente
          //do tamanho, se for utilizar uma GRIDVIEW é necessario usa-lo.
          Expanded(
            flex: 2,
            child: GridView.builder(
              padding: EdgeInsets.all(10.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, //a quantidade de grids que vamos precisar
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0, //O espaçamento lateral entre as grids
                  mainAxisSpacing: 10.0 //Espaçamento Top Bottom entre as grids
              ),

              itemCount: this.gameState.length, // A quantidade de elementos que queremos
              itemBuilder: (context,i)=> SizedBox( //Altura e largura das grids
                width: 100.0,
                height: 100.0,

                child: MaterialButton( // Nossa grid será clicavel, por isso o MaterialButton

                  onPressed: (){
                    this.playGame(i); //Variavel playGame e (i) de index que será passado
                  },
                  child: Image(

                    image: this.getImage(this.gameState[i]), //Mostra a Imagem dentro da grid selecionada
                  ),
                ),
              ),
            ),
          ),

          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,

              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 30),

            child: Container(
              color: Colors.blue[200],
              width: 300.0,
              height: 50.0,
              alignment: Alignment.center,
              child: Text(
                "TIC TAC TOE AVENGERS",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 25.0,
                    fontWeight: FontWeight.w900,
                ),
              ),
            )
          ),
        ],
      ),

    );
  }
}
