import 'package:flutter/material.dart';

import 'model.dart';

class ShowGame extends StatefulWidget {
  @override
  _ShowGameState createState() => _ShowGameState();
}

class _ShowGameState extends State<ShowGame> {
  var animals = getFiveAnimals();
  var score = [];

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFECCEE4),
        title: Text("Score ${score.length} / 5",style: TextStyle( fontFamily: "Diamond", color: Colors.black, fontSize: 24),),
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/mountain3.jpg"), fit: BoxFit.cover),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: animals.map((f) {
                return dragItem(f);
              }).toList(),
            ),
            Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: animals.map((f) {
                return dropItem(f,MediaQuery.of(context).size);
                /* return Text(
                  "${f.name}",
                  style: TextStyle(
                      fontFamily: "Diamond", color: Colors.black, fontSize: 24),
                );*/
              }).toList()
                ..shuffle(),
            )
          ],
        ),
      ),
      floatingActionButton: score.length == 5 ? FloatingActionButton(child: Icon(Icons.refresh),onPressed: (){
        score.clear();
        setState(() {

        });
        
      }) : SizedBox(),
    );

  }

  Widget dragItem(Animal animal) {
    return Draggable(
        data: animal.name,
        child: score.contains(animal.name) ? Image.asset(
          "images/animals.png",
          scale: 5,
        ): Image.asset(
          "images/${animal.imageUrl}",
          scale: 5,
        ),
        feedback: score.contains(animal.name) ? SizedBox() : Image.asset(
          "images/${animal.imageUrl}",
          scale: 5,
        ),
        childWhenDragging: Image.asset(
          "images/animals.png",
          scale: 5,
        ) ,
    );
  }
  Widget dropItem(Animal animal,Size size){
    return Container(

      alignment: Alignment.center,
      height: size.height/5 - 25,
      width: size.width /2,

      child: DragTarget(builder: (context,List<String> accepted,rejected){
        if(score.contains(animal.name)){
          return Text("👍🏻", style: TextStyle(
              fontFamily: "Vermis", color: Colors.black, fontSize: 40),);
        }
        else{
          return Text(animal.name, textAlign:TextAlign.center,style: TextStyle(

              fontFamily: "Vermis", color: Colors.black, fontSize: 18),);
        }
      },onWillAccept: (data){
        print(data);
          if(data == animal.name){

            if(!score.contains(data)) {
              score.add(data);
              setState(() {

              });
            }
            return true;
          }
          else{
            return false;
          }
      },),
    );
  }
}
