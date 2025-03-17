class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tic Tac Toe",
      home: TicTacToeScreen()
    );
  }
}

class TicTacToeScreen extends StatefulWidget {
  const TicTacToeScreen({super.key});

  @override
  State<TicTacToeScreen> createState() => _TicTacToeScreenState();
}

class _TicTacToeScreenState extends State<TicTacToeScreen> {
  List<String> board = List.filled(9, "");
  String currentPlayer = "x";
  bool gameOver = false;
  bool _checkWinner(String player) {
    List<List<int>> winPatterns = [
      [0, 1, 2],
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8],
      [2, 4, 6],
    ];

    for (var pattern in winPatterns) {
      if (board[pattern[0]] == player &&
          board[pattern[1]] == player &&
          board[pattern[2]] == player) {
        return true;
      }
    }
    return false;
  }

  void _resetGame(){
    setState(() {
      board = List.filled(9, "");
      gameOver = false;
      currentPlayer = "x";
    });
  }

  void _showDialog(String message){
    showDialog(
      context: context,
      builder: (context){
        return AlertDialog(
          title: Text("Game Over"),
          content: Text(message, style: const TextStyle(fontSize: 18)),
          actions: [
            ElevatedButton(
                onPressed: (){
                  _resetGame();
                  Navigator.of(context).pop();
                },
                child: const Text("Play Again"))
          ],
        );
      }
    );
  }

  void _markCell(int index){
    if (board[index] == "" && !gameOver){
      setState(() {
        board[index] = currentPlayer;
        if (_checkWinner(currentPlayer)) {
          _showDialog("$currentPlayer wins");
          gameOver = true;
        } else if (!board.contains("")) {
          _showDialog("It's a draw!");
          gameOver = true;
        } else {
          currentPlayer = (currentPlayer == "x") ? "o" : "x";
        }
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tic Tac Toe"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Text(
            "Player $currentPlayer's turn",
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20,),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: board.length,
              itemBuilder: (context, index){
                return GestureDetector(
                  onTap: () => _markCell(index),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                    ),
                    child: Center(
                      child: Text(
                        board[index],
                        style: TextStyle(fontSize: 40),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
}
