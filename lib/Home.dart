// ignore_for_file: prefer_const_literals_to_create_immutables, unused_field, prefer_const_constructors, unused_local_variable, no_leading_underscores_for_local_identifiers, dead_code, unused_element

import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
 List<int> matchedIndexes =[];
 
  int attempts=0;
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;
  String resultDeclaration = '';
  bool winnerFound=false;
  static const maxSeconds=30;
  int seconds=maxSeconds;

  Timer? timer;

void startTimer(){
  timer=Timer.periodic(Duration(seconds:1),(_) {
    setState(() {
      if(seconds>0){
        seconds--;
      }else{
        stopTimer();
      }
    });
   });
}
void stopTimer(){
  resetTimer();

  timer?.cancel();

}
void resetTimer() =>seconds = maxSeconds;
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.redAccent[400],
    ));
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: Scaffold(
          backgroundColor: Colors.redAccent[400],
          appBar: AppBar(
            backgroundColor: Colors.redAccent[400],
            elevation: 0,
            title: Container(),
          ),
          body: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Player O',
                                  style: TextStyle(color: Colors.white,fontSize: 30)),
                              Text(
                                oScore.toString(),
                                style: TextStyle(color: Colors.white,fontSize: 20),
                              ),
                            ],
                          ),
                          SizedBox(width: 30,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                'Player X',
                                style: TextStyle(color: Colors.white,fontSize: 30),
                              ),
                              Text(
                                xScore.toString(),
                                style: TextStyle(color: Colors.white,fontSize: 20),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 50,),
                  Expanded(
                    flex: 4,
                    child: GridView.builder(
                      itemCount: 9,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            _tapped(index);
                          },
                          child: Container(
                              margin: EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Colors.amberAccent),
                                  color:matchedIndexes.contains(index)
                                  ?  Colors.blue:
                                   Colors.amberAccent),
                              child: Center(
                                child: Text(
                                  displayXO[index],
                                  style: TextStyle(
                                      fontSize: 64, color: Colors.redAccent),
                                ),
                              )),
                        );
                      },
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child:
                      Center(
child:Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
  Text(  resultDeclaration,
                        style: TextStyle(color: Colors.white),
                  
                      ),
           SizedBox(height: 10,)   ,
               _buildTimer(),
],)
                      )
                     )
                ],
              )),
        ));
  }

  void _tapped(int index) {
     final isRunning = timer == null ?false:timer!.isActive;
 if(isRunning){
setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes++;
      } else {
        displayXO[index] = 'X';
        filledBoxes++;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
 }
    
  }

  void _checkWinner() {
    //check first row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
       
        resultDeclaration = 'Player ' + displayXO[0] + 'Wins!';
       matchedIndexes.addAll([0,1,2]);
       stopTimer();
         _updateScore(displayXO[0]);
      });
    }
//check second row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[3] + 'Wins!';
          matchedIndexes.addAll([3,4,5]);
       stopTimer();
         _updateScore(displayXO[3]);
      });
    }
    //check third row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[6] + 'Wins!';
          matchedIndexes.addAll([6,7,8]);
       stopTimer();
         _updateScore(displayXO[6]);
      });
    }
    //check first column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + 'Wins!';
          matchedIndexes.addAll([0,3,6]);
       stopTimer();
         _updateScore(displayXO[0]);
      });
      //check second column
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[1] + 'Wins!';
          matchedIndexes.addAll([1,4,7]);
       stopTimer();
         _updateScore(displayXO[1]);
      });
      //chech third column
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[2] + 'Wins!';
          matchedIndexes.addAll([2,5,8]);
       stopTimer();
         _updateScore(displayXO[2]);
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        resultDeclaration = 'Player ' + displayXO[0] + 'Wins!';
          matchedIndexes.addAll([0,4,8]);
       stopTimer();
     _updateScore(displayXO[0]);
      });
    }
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      setState(() {
     
        resultDeclaration = 'Player ' + displayXO[6] + 'Wins!';
          matchedIndexes.addAll([6,4,2]);
       stopTimer();
    _updateScore(displayXO[6]);
      });
    } if(!winnerFound && filledBoxes==9){
      setState(() {
        resultDeclaration='Nobody wins!';
      });
    }
  }
    void _updateScore(String winner){
      if(winner =='O'){
        oScore++;
      }else if (winner =='X'){
        xScore++;
      }
      winnerFound=true;
    }
    void _clearBoard(){
      setState(() {
        for(int i=0;i<9;i++){
          displayXO[i]='';


        }
        resultDeclaration='';
      });
      filledBoxes=0;
    }
    Widget _buildTimer(){
      final isRunning = timer == null ?false:timer!.isActive;
  return isRunning 
  ? SizedBox(width: 100,
  height: 100,
child: Stack(
  fit:StackFit.expand,
  children: [
    CircularProgressIndicator(
      value: 1 -seconds / maxSeconds,
      valueColor: AlwaysStoppedAnimation(Colors.white),
      strokeWidth: 8 ,
      
      backgroundColor: Colors.blue,
    ),
    Center(
      child: Text(
        '$seconds',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 50
        ),
      ),
    )
  ],
),
  ):
    
   ElevatedButton(
            style: ElevatedButton.styleFrom(
             backgroundColor: Colors.white,
             padding: EdgeInsets.symmetric(
              horizontal: 32,vertical: 16
             ) 
            ),
            onPressed:(){
              startTimer();
_clearBoard();
attempts++;
            },
            child: Text(
              attempts==0 ? 'Start' :
              'Play Again',style: TextStyle(fontSize: 20,color: Colors.black),),
              
            ) ;
    }
  }

