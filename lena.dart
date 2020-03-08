import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myflutter_app/screens/log_in.dart';

var location = 0;
var sweet_tooth = 0;
var results = [0, 0, 0, 0, 0, 0];
var questionNumber = 0;
var quiz = new MenuQuiz();

var freq = [0, 0, 0, 0, 0, 0, 0];
int menu_num = 0;
int max = 0;
var result;

var coco_nonsweet = [
  "Black Tea Macchiato",
  "Pearl Milk Tea",
  "Honeymilk Tea",
  "Three Guys",
  "Two Ladies"
];

var coco_sweet = [
  "Fresh Taro Milk Tea",
  "Mango Green Tea",
  "Brown Sugar Latte",
  "Mango Smoothie",
  "Chocolate Milk Tea"
];

var pf_sweet = [
  "Passionfruit Tea",
  "Oreo Twist",
  "Strawberry Milk",
  "Matcha Red Bean Milk Tea"
];

var pf_nonsweet = [
  "Black Milk Tea",
  "Honey Milk Tea",
  "Oolong Milk Tea",
  "Taro Smoothie",
  "Matcha Ice Cream",
  "UFO"
];


class MenuQuiz{
var quiz_images = ["party", "sleep", "start_text", "party", "party",
                    "party", "sleep", "start_text"];

var questions = [
  "Choose your location.",
  "Do you have a sweet tooth?",
  "What is your favorite study spot?",
  "Where is your dream vacation?",
  "Toes as fingers? or Fingers as toes?",
  "What is your favorite snack?",
  "What color scheme do you like?",
  "What do you do in your free time?"
];

var choices = [
  ["Coco", "Pearl Fever", "", ""],
  ["Yes", "No", "", ""],
  ["Quiet Library", "Coffee Shop", "At Home", "I don't study!"],
  ["Egypt", "New York", "Tokyo", "Bali"],
  ["Toes as Fingers", "Fingers as Toes", "", ""],
  ["Fruits", "Cookies", "Chips", "Nuts"],
  ["Red", "Blue", "White", "Yellow"],
  ["Party", "Watch Movies", "Sleep", "Exercise"]
];

}

class Quiz1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

class Quiz1State extends State<Quiz1> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topCenter,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(20.0)),

                new Container(
                  alignment: Alignment.centerRight,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Text("Question ${questionNumber + 1} of ${quiz.questions.length}",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),),
                    ],
                  ),
                ),


                //image
                new Padding(padding: EdgeInsets.all(10.0)),

                new Image.asset(
                  "images/${quiz.quiz_images[questionNumber]}.jpg",
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Text(quiz.questions[questionNumber],
                  style: new TextStyle(
                    fontSize: 20.0,
                  ),),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 1
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if (questionNumber == 0) {
                          location = 1;
                          debugPrint("Location: Pearl Fever");
                        }
                        else if (questionNumber == 1) {
                          sweet_tooth = 1;
                          debugPrint("Sweet Selected");
                        }
                        else if (questionNumber == 2) {
                          debugPrint("Quiet Library");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 1;
                            } else {
                              results[questionNumber - 2] = 1;
                            }
                          }
                          else {
                            if (location == 1) {
                              results[questionNumber - 2] = 2;
                            } else {
                              results[questionNumber - 2] = 5;
                            }
                          }
                        }
                        else if (questionNumber == 3) {
                          debugPrint("Egypt");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 3;
                            } else {
                              results[questionNumber - 2] = 5;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 6;
                            else {
                              results[questionNumber - 2] = 3;
                            }
                          }
                        }
                        else if (questionNumber == 4) {
                          debugPrint("Toes as Fingers");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 1;
                            } else {
                              results[questionNumber - 2] = 5;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 2;
                            else {
                              results[questionNumber - 2] = 4;
                            }
                          }
                        }
                        else if (questionNumber == 5) {
                          debugPrint("Fruits");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 1;
                            } else {
                              results[questionNumber - 2] = 2;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 1;
                            else {
                              results[questionNumber - 2] = 4;
                            }
                          }
                        }

                        else if (questionNumber == 6) {
                          debugPrint("Red");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 3;
                            } else {
                              results[questionNumber - 2] = 3;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 3;
                            else {
                              results[questionNumber - 2] = 5;
                            }
                          }
                        }
                        else if (questionNumber == 7) {
                          debugPrint("Party");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 2;
                            } else {
                              results[questionNumber - 2] = 4;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 3;
                            else {
                              results[questionNumber - 2] = 3;
                            }
                          }
                        }
                        else {
                          debugPrint("Invalid result");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][0],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                    //button 2
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if (questionNumber == 0) {
                          location = 2;
                          debugPrint("Location: Coco");
                        }
                        else if (questionNumber == 1) {
                          sweet_tooth = 2;
                          debugPrint("Unsweet Selected");
                        }
                        else if (questionNumber == 2) {
                          debugPrint("Coffee Shop");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 4;
                            } else {
                              results[questionNumber - 2] = 3;
                            }
                          }
                          else {
                            if (location == 1) {
                              results[questionNumber - 2] = 6;
                            } else {
                              results[questionNumber - 2] = 1;
                            }
                          }
                        }
                        else if (questionNumber == 3) {
                          debugPrint("New York");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 2;
                            } else {
                              results[questionNumber - 2] = 2;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 5;
                            else {
                              results[questionNumber - 2] = 1;
                            }
                          }
                        }
                        else if (questionNumber == 4) {
                          debugPrint("Fingers as toes");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 3;
                            } else {
                              results[questionNumber - 2] = 4;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 2;
                            else {
                              results[questionNumber - 2] = 4;
                            }
                          }
                        }
                        else if (questionNumber == 5) {
                          debugPrint("Cookies");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 2;
                            } else {
                              results[questionNumber - 2] = 3;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 2;
                            else {
                              results[questionNumber - 2] = 3;
                            }
                          }
                        }

                        else if (questionNumber == 6) {
                          debugPrint("Blue");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 4;
                            } else {
                              results[questionNumber - 2] = 1;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 5;
                            else {
                              results[questionNumber - 2] = 3;
                            }
                          }
                        }
                        else if (questionNumber == 7) {
                          debugPrint("Watch Movies");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 3;
                            } else {
                              results[questionNumber - 2] = 1;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 6;
                            else {
                              results[questionNumber - 2] = 4;
                            }
                          }
                        }
                        else {
                          debugPrint("Invalid result");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                new Padding(padding: EdgeInsets.all(10.0)),

                new Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    //button 3
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if (questionNumber == 0) {
                          debugPrint("Location: Invalid");
                        }
                        else if (questionNumber == 1) {
                          debugPrint("Sweetness: Invalid");
                        }
                        else if (questionNumber == 2) {
                          debugPrint("At Home");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 3;
                            } else {
                              results[questionNumber - 2] = 2;
                            }
                          }
                          else {
                            if (location == 1) {
                              results[questionNumber - 2] = 1;
                            } else {
                              results[questionNumber - 2] = 2;
                            }
                          }
                        }
                        else if (questionNumber == 3) {
                          debugPrint("Tokyo");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 4;
                            } else {
                              results[questionNumber - 2] = 3;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 3;
                            else {
                              results[questionNumber - 2] = 2;
                            }
                          }
                        }
                        else if (questionNumber == 4) {
                          debugPrint("Invalid");
                        }
                        else if (questionNumber == 5) {
                          debugPrint("Chips");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 3;
                            } else {
                              results[questionNumber - 2] = 1;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 3;
                            else {
                              results[questionNumber - 2] = 2;
                            }
                          }
                        }

                        else if (questionNumber == 6) {
                          debugPrint("White");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 2;
                            } else {
                              results[questionNumber - 2] = 2;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 1;
                            else {
                              results[questionNumber - 2] =1;
                            }
                          }
                        }
                        else if (questionNumber == 7) {
                          debugPrint("Sleep");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 4;
                            } else {
                              results[questionNumber - 2] = 3;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 1;
                            else {
                              results[questionNumber - 2] = 5;
                            }
                          }
                        }
                        else {
                          debugPrint("Invalid result");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

                  ],
                ),

                    //button 4
                    new MaterialButton(
                      minWidth: 120.0,
                      color: Colors.blueGrey,
                      onPressed: (){
                        if (questionNumber == 0) {
                          debugPrint("Location: Invalid");
                        }
                        else if (questionNumber == 1) {
                          debugPrint("Sweetness: Invalid");
                        }
                        else if (questionNumber == 2) {
                          debugPrint("I do not study");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 2;
                            } else {
                              results[questionNumber - 2] = 5;
                            }
                          }
                          else {
                            if (location == 1) {
                              results[questionNumber - 2] = 4;
                            } else {
                              results[questionNumber - 2] = 4;
                            }
                          }
                        }
                        else if (questionNumber == 3) {
                          debugPrint("Bali");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 1;
                            } else {
                              results[questionNumber - 2] = 4;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 4;
                            else {
                              results[questionNumber - 2] = 5;
                            }
                          }
                        }
                        else if (questionNumber == 4) {
                          debugPrint("Invalid");
                        }
                        else if (questionNumber == 5) {
                          debugPrint("Nuts");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 4;
                            } else {
                              results[questionNumber - 2] = 4;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 5;
                            else {
                              results[questionNumber - 2] = 1;
                            }
                          }
                        }

                        else if (questionNumber == 6) {
                          debugPrint("Yellow");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 1;
                            } else {
                              results[questionNumber - 2] = 4;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 6;
                            else {
                              results[questionNumber - 2] =4;
                            }
                          }
                        }
                        else if (questionNumber == 7) {
                          debugPrint("Exercise");
                          if (sweet_tooth == 1) {
                            if (location == 1) {
                              results[questionNumber - 2] = 1;
                            } else {
                              results[questionNumber - 2] = 2;
                            }
                          } else {
                            if (location == 1)
                              results[questionNumber - 2] = 4;
                            else {
                              results[questionNumber - 2] = 2;
                            }
                          }
                        }
                        else {
                          debugPrint("Invalid result");
                        }
                        updateQuestion();
                      },
                      child: new Text(quiz.choices[questionNumber][1],
                        style: new TextStyle(
                            fontSize: 20.0,
                            color: Colors.white
                        ),),
                    ),

            new Padding(padding: EdgeInsets.all(15.0)),

                new Container(
                    alignment: Alignment.bottomCenter,
                    child:  new MaterialButton(
                        minWidth: 240.0,
                        height: 30.0,
                        color: Colors.red,
                        onPressed: resetQuiz,
                        child: new Text("Quit",
                          style: new TextStyle(
                              fontSize: 18.0,
                              color: Colors.white
                          ),)
                    )
                ),

              ],
            ),
          ),

        )
    );
  }

  void resetQuiz(){
    setState(() {
      Navigator.pop(context);
      location = 0;
      sweet_tooth = 0;
      results = [0, 0, 0, 0, 0, 0];
      questionNumber = 0;
    });
  }

  void updateQuestion(){
    setState(() {
      if(questionNumber == quiz.questions.length - 1) {
        for (int i = 0; i < 6; i++)
          freq[results[i]]++;

        max = freq[1];
        menu_num = 1;
        for (int i = 2; i < 7; i++) {
          if (freq[i] > max) {
            max = freq[i];
            menu_num = i;
          }
        }

        if (location == 1 && sweet_tooth == 1) {
          result = pf_sweet[menu_num];
        } else if (location == 1 && sweet_tooth == 2) {
          result = pf_nonsweet[menu_num];
        } else if (location == 2 && sweet_tooth == 1) {
          result = coco_sweet[menu_num];
        } else if (location == 1 && sweet_tooth == 2) {
          result = coco_nonsweet[menu_num];
        } else {
          debugPrint("Either location or sweetness unselected.");
        }

        Navigator.push(context, new MaterialPageRoute(
            builder: (context) => new Summary(ret: result,)));
      }else
        questionNumber++;
    });
  }
}


class Summary extends StatelessWidget{
  final ret;
  Summary({Key key, @required this.ret}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  return new WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(

      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            new Text("Here's my recommendation for you!: $ret",
              style: new TextStyle(
                  fontSize: 35.0
              ),),

            new Padding(padding: EdgeInsets.all(30.0)),

            new MaterialButton(
              color: Colors.red,
              onPressed: (){
                location = 0;
                sweet_tooth = 0;
                results = [0, 0, 0, 0, 0, 0];
                questionNumber = 0;
                Navigator.pop(context);
                },
              child: new Text("Reset Quiz",
                style: new TextStyle(
                    fontSize: 20.0,
                    color: Colors.white
                ),),)

  ],
  ),
  ),
  ),
  );
  }
}
