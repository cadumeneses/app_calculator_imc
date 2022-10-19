import 'package:calculator_imc/app/models/person_model.dart';

class ImcModel {

  void calculation(PersonModel person){
    final double imc;

    imc = person.weight / (person.height * person.height);

    if (person == null) {
      
    }
  }
}