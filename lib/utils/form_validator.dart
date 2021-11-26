import 'dart:async';

class FormValidator{

  final _textOnlyController = StreamController();
  Stream get textOnlyStream => _textOnlyController.stream;

  dispose(){
    _textOnlyController.close();
  }

  updateTextOnly(var input){
    (input==null || input =="")?_textOnlyController.sink.addError("Field is empty"):_textOnlyController.sink.add(input);
  }
}


