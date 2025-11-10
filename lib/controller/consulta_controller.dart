import 'package:consulta_cep/model/consulta.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class ConsultaController {
  bool isLoading = false;

  String errorMessage = '';

  Consulta consulta = Consulta.empty();

  TextEditingController cepController = TextEditingController();

  void setLoading(bool value) {
    print("APP CARREGANDO $value");
    isLoading = value;
  }

  void setErrorMessage(String message) {
    print("APP ERRO $message");
    errorMessage = message;
  }

  void setConsulta(Consulta newConsulta) {
    consulta = newConsulta;
    print("APP CONSULTA ${consulta.toString()}");
  }

  Future<void> getConsulta() async {
    setLoading(true);

    final url = Uri.parse('https://viacep.com.br/ws/${formatarCep(cepController.text)}/json/');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final consulta = Consulta.fromJson(response.body);
      setConsulta(consulta);
    } else {
      throw Exception('Erro ao carregar dados do CEP');
    }
    setLoading(false);
  }
}

String formatarCep(String cep) {
  final numericCep = cep.replaceAll(RegExp(r'[^0-9]'), '');
  if (numericCep.length != 8) {
    throw FormatException('CEP deve conter 8 dígitos numéricos.');
  }
  return numericCep;
}