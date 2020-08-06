import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    if (buttonText == "clear") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "*" ||
        buttonText == "/") {
      num1 = double.parse(output);
      operand = buttonText;
      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("already contains a decimal");
        return;
      } else {
        _output = _output + buttonText;
      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "*") {
        // ignore: unnecessary_statements
        _output == (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {
          buttonPressed(buttonText),
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
          child: new Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(
              vertical: 24.0,
              horizontal: 12.0,
            ),
            alignment: Alignment.centerRight,
            child: new Text(
              output,
              style: TextStyle(
                fontSize: 36.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          new Expanded(
            child: new Divider(),
          ),
          new Row(children: [
            buildbutton("7"),
            buildbutton("8"),
            buildbutton("9"),
            buildbutton("/"),
          ]),
          new Row(children: [
            buildbutton("4"),
            buildbutton("5"),
            buildbutton("6"),
            buildbutton("*"),
          ]),
          new Row(children: [
            buildbutton("1"),
            buildbutton("2"),
            buildbutton("3"),
            buildbutton("-"),
          ]),
          new Row(children: [
            buildbutton("."),
            buildbutton("0"),
            buildbutton("00"),
            buildbutton("+"),
          ]),
          new Row(children: [
            buildbutton("clear"),
            buildbutton("="),
          ]),
        ],
      )),
    );
  }
}
