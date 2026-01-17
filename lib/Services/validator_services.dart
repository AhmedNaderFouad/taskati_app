class ValidatorService{

  static String? nameValidator(String? text){
    if(text!.isEmpty){
      return "the field is empty ";
    }
    else if (!(RegExp(r'^[a-zA-Z\s]+$').hasMatch(text))) {
      return "the name shouldn't have numbers";
    }

  }


}