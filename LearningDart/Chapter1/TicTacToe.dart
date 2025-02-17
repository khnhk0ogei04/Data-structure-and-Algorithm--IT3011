import "package:flutter/material.dart";
void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      title: "Tic Tac Toe",
      theme: ThemeData(
        primaryColor: Colors.blue
      ),
      home: TicTacToePage(),
    );
  }
}

class TicTacToePage extends StatefulWidget{
  @override
  _TicTacToePageState createState() => _TicTacToePageState();
}

class _TicTacToePageState extends State<TicTacToePage>{
  late List<String> board;
  late String currentPlayer;
  late String winner;
  late bool isDraw;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame(){
    board = List.generate(9, (_) => "");
    currentPlayer = "x";
    winner = "";
    isDraw = false;
  }

  void _handleTap(int index){
    if (board[index] != "" || winner != ""){
      return;
    }

    setState(() {
      board[index] = currentPlayer;
      if (_checkWinner(currentPlayer)){
        winner = currentPlayer;
      } else if (_checkDraw()){
        isDraw = true;
      } else {
        if (currentPlayer == "x"){
          currentPlayer = "o";
        } else {
          currentPlayer = "x";
        }
      }
    });
  }

  bool _checkWinner(String curPlayer){
    for (int i = 0; i < 3; i++) {
      if (board[3 * i] == curPlayer &&
          board[3 * i + 1] == curPlayer &&
          board[3 * i + 2] == curPlayer
      ) {
        return true;
      } else if (board[i] == curPlayer
          && board[i + 3] == curPlayer
          && board[i + 6] == curPlayer
      ) {
        return true;
      }
    }
      if (board[0] == curPlayer && board[4] == curPlayer && board[8] == curPlayer){
        return true;
      }
      if (board[2] == curPlayer && board[4] == curPlayer && board[6] == curPlayer){
        return true;
      }
      return false;
    }

    bool _checkDraw(){
      for (int i = 0; i < 9; i++){
        if (board[i] == ""){
          return false;
        }
      }
      return true;
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Tic Tac Toe"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (winner != "")
              Text(
                "Winner: $winner",
                style: const TextStyle(fontSize: 30)
              )
            else if (isDraw)
              const Text('Draw', style: TextStyle(fontSize: 30))
            else
              Text('Current Player: $currentPlayer', style: const TextStyle(fontSize: 30)),
            Expanded(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemCount: 9,
                  itemBuilder: (BuildContext context, int index){
                    return GridTile(
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black)
                        ),
                        child: MaterialButton(
                          onPressed: () => _handleTap(index),
                          child: Text(
                            board[index],
                            style: const TextStyle(fontSize: 40),
                          )
                        ),
                      )
                    );
                  }
              ),
            ),
            MaterialButton(
            child: const Text(
              'Restart Game',
              style: TextStyle(
                color: Colors.redAccent,
                fontWeight: FontWeight.bold
              ), 
            ),
            onPressed: () {
              setState(() {
                _initializeGame();
              });
            },
          ),
          ],
        )
      );
    }
  }
