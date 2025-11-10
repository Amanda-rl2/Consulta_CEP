import 'package:consulta_cep/controller/consulta_controller.dart';
import 'package:consulta_cep/widgets/card_information_widget.dart';
import 'package:flutter/material.dart';

class ConsultaPage extends StatefulWidget {
  const ConsultaPage({super.key});

  @override
  State<ConsultaPage> createState() => _ConsultaPageState();
}

class _ConsultaPageState extends State<ConsultaPage> {
  ConsultaController controller = ConsultaController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Consulta'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: TextFormField(
                    decoration: const InputDecoration(labelText: 'CEP'),
                    controller: controller.cepController,
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () async {
                      await controller.getConsulta();
                      setState(() {});
                    },
                    child: const Text('Consultar'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),
            CardInformationWidget(
              title: 'Logradouro',
              value: controller.consulta.logradouro,
            ),
            CardInformationWidget(
              title: 'Bairro',
              value: controller.consulta.bairro,
            ),
            CardInformationWidget(title: 'UF', value: controller.consulta.uf),
          ],
        ),
      ),
    );
  }
}
