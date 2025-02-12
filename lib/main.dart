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
  String _operated = '';
  double _num1 = 0;
  double _num2 = 0;

  void buttonPress(String value){
    setState(() {
      if(value =='C'){
        String _output = '0';
        String _input = '';
        String _operated = '';
        double _num1 = 0;
        double _num2 = 0;
      }else if(value=='='){
        _num2 = double.parse(_input);
        if(_operated == '+'){
          _output = (_num1 + _num2).toString();
        }else if(_operated == '-'){
          _output = (_num1 - _num2).toString();
        }else if(_operated == 'X'){
          _output = (_num1 * _num2).toString();
        }else if(_operated == '/'){
          _output = (_num2 !=0) ? (_num1 / _num2).toString():'Error';
        }
        _input = _output;
      }else if(['+', '-','*', '/'].contains(value)){
        _num1 = double.parse(_input);
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
              BuildButton(text: '7', color: null,),
              BuildButton(text: '8', color: null,),
              BuildButton(text: '9', color: null,),
              BuildButton(text: '/', color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              BuildButton(text: '4', color: null,),
              BuildButton(text: '5', color: null,),
              BuildButton(text: '6', color: null,),
              BuildButton(text: 'X', color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              BuildButton(text: '1', color: null,),
              BuildButton(text: '2', color: null,),
              BuildButton(text: '3', color: null,),
              BuildButton(text: '-', color: Colors.orange,),
            ],
          ),
          Row(
            children: [
              BuildButton(text: 'C', color: Colors.red,),
              BuildButton(text: '0', color: null,),
              BuildButton(text: '=', color: Colors.green,),
              BuildButton(text: '+', color: Colors.orange,),
            ],
          ),

        ],
      ),
    );
  }
}


