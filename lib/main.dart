import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'Widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      );
    });
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _output = '0';
  String _input = '';
  String operand = '';
  double _num1 = 0;
  double _num2 = 0;

  void buttonPress(String value){
    setState(() {
      if(value =='C'){
        _output = '0';
        _input = '';
        operand = '';
        _num1 = 0;
        _num2 = 0;
      }else if(value=='='){
        _num2 = double.parse(_input);
        if(operand == '+'){
          _output = (_num1 + _num2).toString();
        }else if(operand == '-'){
          _output = (_num1 - _num2).toString();
        }else if(operand == '*'){
          _output = (_num1 * _num2).toString();
        }else if(operand == '/'){
          _output = (_num2 !=0) ? (_num1 / _num2).toString():'Error';
        }
        _input = _output;
      }else if(['+', '-','*', '/'].contains(value)){
        _num1 = double.parse(_input);
        operand = value;
        _input = '';
      }else{
        _input += value;
        _output = _input;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text('Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(24),
              child: Text(_output,
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            ),
          ),
          Row(
            children: [
              BuildButton(text: '7', onClick: () => buttonPress('7') ,),
              BuildButton(text: '8', onClick: () => buttonPress('8'),),
              BuildButton(text: '9', onClick: () => buttonPress('9')),
              BuildButton(text: '/', color: Colors.orange,onClick: () => buttonPress('/')),
            ],
          ),
          Row(
            children: [
              BuildButton(text: '4',onClick: () => buttonPress('4')),
              BuildButton(text: '5',onClick: () => buttonPress('5')),
              BuildButton(text: '6', onClick: () => buttonPress('6')),
              BuildButton(text: 'X', color: Colors.orange,onClick: () => buttonPress('*')),
            ],
          ),
          Row(
            children: [
              BuildButton(text: '1',onClick: () => buttonPress('1')),
              BuildButton(text: '2',onClick: () => buttonPress('2')),
              BuildButton(text: '3',onClick: () => buttonPress('3')),
              BuildButton(text: '-', color: Colors.orange,onClick: () => buttonPress('-')),
            ],
          ),
          Row(
            children: [
              BuildButton(text: 'C', color: Colors.red,onClick: () => buttonPress('C')),
              BuildButton(text: '0',onClick: () => buttonPress('0')),
              BuildButton(text: '=', color: Colors.green,onClick: () => buttonPress('=')),
              BuildButton(text: '+', color: Colors.orange,onClick: () => buttonPress('+')),
            ],
          ),

        ],
      ),
    );
  }
}


