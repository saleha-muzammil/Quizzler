import 'questions.dart';

class quizbank
{
  int questionno =0 ;
  List <Questions> _questionbank =
  [
    Questions(q: 'You can lead a cow downstairs but not upstairs' , a: false),
    Questions(q: 'Approximately 1/4 of human bones are in feet' , a: true) ,
    Questions(q: 'A slug\'s blood is green' , a: true) ,
    Questions(q: 'Pakistan\'s capital is lahore' , a:false),
    Questions(q: 'Flutter is awesome' , a:true),
    Questions(q: 'Eygpt has the most number of pyramids in the world' , a:false),
    Questions(q: 'Dead skin is the main ingredient of household dust' , a:true),
    Questions(q: 'More than half of the population of the world lives in Asia' , a:true),

  ] ;

  void incrementquestion()
  {
    if (questionno>-1 && questionno < _questionbank.length -1) {
      questionno++;
    }
    else
      questionno= -1 ;
  }
  String getquestion()
  {
    if (questionno== -1)
      {
        return 'End' ;
      }
    return _questionbank[questionno].question ;
  }
  bool getanswer ()
  {
    return _questionbank[questionno].answer ;
  }
  bool checkcount()
  {
   if (questionno==-1)
     return true  ;
   return false;
  }
}