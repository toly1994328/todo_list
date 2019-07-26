import 'package:flutter/material.dart';

class TextButton extends StatelessWidget {
  var todo=<String>[];
  var text;

  @override
  Widget build(BuildContext context) {
    var textField = TextField(
      keyboardType: TextInputType.text,
      textAlign: TextAlign.start,
      maxLines: 1,
      cursorColor: Colors.black,
      cursorWidth: 3,
      style: TextStyle(
          fontSize: 16, color: Colors.lightBlue, backgroundColor: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: 'add a todo item',
        hintStyle: TextStyle(color: Colors.black26),
        contentPadding: EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
        ),
      ),
      onChanged: (str) {
        print(str);
        text=str;
      },
      onEditingComplete: () {
        print("onEditingComplete");
      },
      onSubmitted: (str) {
        print("onSubmitted:" + str);
        FocusScope.of(context).requestFocus(FocusNode()); //收起键盘
      },
      onTap: () {
        print("onTap");
      },
    );

    var btn = RaisedButton(
      child: Icon(Icons.add),
      padding: EdgeInsets.zero,
      onPressed: () {
        todo.add(text);


      },
    );



    var result = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          child: textField,
          width: 200,
        ),
        ClipRRect(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), bottomRight: Radius.circular(10)),
          child: Container(
            child: btn,
            width: 36,
            height: 36,
          ),
        ),
      ],
    );

    //竖直
    var list_view_test = ListView.builder(
      itemCount: 20,
      padding: EdgeInsets.all(8.0),
      itemExtent: 60.0,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Center(child: Text('toly $index')),
        );
      },
    );



    return result;
  }
}
