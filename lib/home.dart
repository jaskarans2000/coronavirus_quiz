import 'dart:math';

import 'package:coronavirusquiz/question.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List questionBank = [
  Question.name(
      "Attend public gatherings such as concerts,conventions and parties.", false),
  Question.name("Avoid Corona brand beer,it will give drinkers the virus.", false),
  Question.name(
      "Avoid touching your eyes,nose and mouth.",
      true),
  Question.name("Begin the process of cutting paper towel rolls in half to double as toilet paper.", false),
  Question.name("Call ahead to doctor's office or emergency room before going in(unless someone is in critical state).",
      true),
  Question.name("Clean and disinfect frequently touched surfaces daily,especially if there is a COVID patient in your home.", true),
  Question.name("Cover your cough or sneeze with a tissue.", true),
  Question.name("Drink a lots of water so the virus is pushed from the throat to the stomach where the acid will kill it.", false),
  Question.name("Gather everyone you know has any mild symptoms,then all head to hospital at once.Medical staff prefers this.", false), //6
  Question.name("Go to your local supermarket and claim all of the toilet paper.", false),
  Question.name(
      "Hibernate until the summer months,when the virus will go away forever.", false),
  Question.name("Immediately wash your hands after sneezing/coughing/etc.", true),
  Question.name("Mix household chemicals and medications together to work against the virus.", false),
  Question.name("Notify medical staff if you've been around a COVID-19 patient or area.", true),
  Question.name('Once infected consume bleach in order to kill the virus.', false),
  Question.name('Opt for hand sanitizers over soap and water they work better.', false),
  Question.name('Put hand sanitizers on. then shake as many hands as you can to conserve resources.', false),
  Question.name('Put on a facemask if you are sick or caring for someone who is.', true),
  Question.name('Remain about six feet away from other people especially in public spaces.', true),
  Question.name('Stay home if you feel symptoms.', true),
  Question.name('Seek medical advice if you have acute symptoms of fever/cough or shortness of breath.', true),
  Question.name('Use hand sanitizer that is atleast 60% alcohol.', true),
  Question.name('Travel to as many foreign counteries as possible to increase morale.', false),
  Question.name('Wash your hands for atleast 20 secods frequently.', true),
  Question.name('When quarantined make sure to escape.This will show others that everything is normal.', false)
];


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index;
  @override
  void initState() {
    // TODO: implement initState
    Random random=new Random();
   setState(() {
     index=random.nextInt(questionBank.length);
   });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Corona Virus"),
        backgroundColor: Colors.redAccent.shade400,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueAccent,
      body:Builder(builder: (BuildContext context){
        return Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/coronavirus.png",
                  height: 210.0,
                  width: 350.0,),
              ),
              Container(
                height: 180.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.white,style: BorderStyle.solid)
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${questionBank[index%questionBank.length].question}",
                      style: TextStyle(color: Colors.white,fontSize: 18.0),),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(onPressed: (){
                    setState(() {
                      index=index-1;
                    });
                  },
                      color: Colors.blue.shade900,
                      child: Icon(Icons.arrow_back,color: Colors.white,)),
                  RaisedButton(onPressed: (){
                    checkAnswer(true,context);
                  },
                    color: Colors.blue.shade900,
                    child: Text("True",style: TextStyle(color: Colors.white),),),
                  RaisedButton(onPressed: (){
                    checkAnswer(false, context);
                  },
                    color: Colors.blue.shade900,
                    child: Text("False",style: TextStyle(color: Colors.white),),),
                  RaisedButton(onPressed: (){
                    setState(() {
                      index=index+1;
                    });
                  },
                      color: Colors.blue.shade900,
                      child: Icon(Icons.arrow_forward,color: Colors.white,))
                ],
              )
            ],
          ),
        );
      })
    );
  }

  void checkAnswer(bool param0, BuildContext context) {
    String status;
    if(param0==questionBank[index].isCorrect){
      status="Correct Answer";
    }
    else{
      status="Wrong Answer";
    }
    SnackBar snackBar=new SnackBar(content: Text(status,style: TextStyle(color: Colors.white),),
    backgroundColor: status=="Correct Answer"?Colors.green:Colors.red,);
    Scaffold.of(context).showSnackBar(snackBar);
    setState(() {
      index=index+1;
    });
  }
}
