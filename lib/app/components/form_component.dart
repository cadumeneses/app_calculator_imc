import 'package:flutter/material.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({super.key});

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  final _weigthController = TextEditingController();
  final _heigthController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (!isValid) {
      return;
    }

    setState(() {
      double heigth = double.parse(_heigthController.text) / 100;
      double weigth = double.parse(_weigthController.text);
      double imc = weigth / (heigth * heigth);

      debugPrint(imc.toString());

      if (imc < 16) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Magreza GRAVE'),
                content: Text('Seu imc é: $imc e o ideal é: entre 18,5 a 25'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Voltar'),
                  )
                ],
              )),
        );
      } else if (imc > 16 && imc < 17) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Magreza MODERADA'),
                content: Text('Seu imc é: $imc e o ideal é: entre 18,5 a 25'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Voltar'),
                  )
                ],
              )),
        );
      } else if (imc > 17 && imc < 18.5) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Magreza LEVE'),
                content: Text('Seu imc é: $imc e o ideal é: entre 18,5 a 25'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Voltar'),
                  )
                ],
              )),
        );
      } else if (imc >= 18.5 && imc < 25) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Você está no peso ideal! Parabéns'),
                content: Text('Seu imc é: $imc, você está saúdavel!'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Voltar'),
                  )
                ],
              )),
        );
      } else if (imc > 25 && imc < 30) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Você está com sobrepeso'),
                content: Text('Seu imc é: $imc e o ideal é: entre 18,5 a 25'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Voltar'),
                  )
                ],
              )),
        );
      } else if (imc >= 30 && imc < 35) {
        showDialog(
            context: context,
            builder: ((context) => AlertDialog(
                  title: const Text('Você está com obesiade grau I'),
                  content: Text('Seu imc é: $imc e o ideal é: entre 18,5 a 25'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('Voltar'),
                    )
                  ],
                )));
      } else if (imc >= 35 && imc < 40) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Você está com obesiade grau II(SEVERA)'),
                content: Text('Seu imc é: $imc e o ideal é: entre 18,5 a 25'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Voltar'),
                  )
                ],
              )),
        );
      } else if (imc >= 40) {
        showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                title: const Text('Você está com obesiade grau IIi(MÓRBIDA)'),
                content: Text('Seu imc é: $imc e o ideal é: entre 18,5 a 25'),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('Voltar'),
                  )
                ],
              )),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.9,
            decoration: const BoxDecoration(
              color: Color(0xFFf4f5fa),
            ),
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.purple)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.purple, fontSize: 25.0),
                  controller: _weigthController,
                  validator: (value) {
                    final weight = value ?? '';
                    if (weight.trim().isEmpty) {
                      return "Insira seu Peso!";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "Altura (CM)",
                      labelStyle: TextStyle(color: Colors.purple)),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.purple, fontSize: 25.0),
                  controller: _heigthController,
                  validator: (value) {
                    final height = value ?? '';
                    if (height.trim().isEmpty) {
                      return "Insira sua altura!";
                    }
                    return null;
                  },
                ),
                
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:15),
            child: ElevatedButton(
                  onPressed: _submitForm, child: const Text('Calcular')),
          )
        ],
      ),
    );
  }
}
