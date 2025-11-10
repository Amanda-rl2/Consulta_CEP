import 'package:consulta_cep/controller/consulta_controller.dart';
import 'package:consulta_cep/widgets/card_information_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      appBar: AppBar(
        title: Text(
          'Consulta',
          style: GoogleFonts.kodchasan(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.green.shade400,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              color: Color(0xffe0f2dc),
              child: Row(
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
            ),

            const SizedBox(height: 20),
            CardInformationWidget(
              title: 'Logradouro',
              value: controller.consulta.logradouro,
              color: Color(0xffe1e9d5),
            ),
            CardInformationWidget(
              title: 'Bairro',
              value: controller.consulta.bairro,
              color: Color(0xffe1e9d5),
            ),
            CardInformationWidget(
              title: 'UF',
              value: controller.consulta.uf,
              color: Color(0xffe1e9d5),
            ),
          ],
        ),
      ),
    );
  }
}
