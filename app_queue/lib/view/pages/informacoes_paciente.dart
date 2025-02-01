import 'package:app_queue/model/ficha/Prioridade.dart';
import 'package:app_queue/model/ficha/ficha_model.dart';
import 'package:app_queue/model/paciente_model.dart';
import 'package:app_queue/view/components/my_button.dart';
import 'package:app_queue/view/components/my_text_input.dart';
import 'package:app_queue/view/helpers/interface_helpers.dart';
import 'package:app_queue/view/helpers/route_helpers.dart';
import 'package:flutter/material.dart';
import 'package:app_queue/controller/ficha/ficha_controller.dart';
import 'package:app_queue/view/components/my_text_output.dart'; // Import do novo componente
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class InformacoesPaciente extends StatefulWidget {
  const InformacoesPaciente({super.key});

  @override
  State<InformacoesPaciente> createState() => _InformacoesPacienteState();
}

class _InformacoesPacienteState extends State<InformacoesPaciente> {
  final FichaController _fichaController = FichaController();
  var paciente;
  var ficha;
  FichaModel? _fichaModel;
  Prioridade? prioridade;
  String pacienteId = '';

  final TextEditingController observacoesMedico = TextEditingController();

  @override
  void initState() {
    super.initState();
    teste();
  }

  void teste() async {
    ficha = await _fichaController.getFichasDoDia();

    if (ficha.isNotEmpty) {
      setState(() {
        var pacienteParse = ficha[0].get<ParseObject>('paciente');
        if (pacienteParse != null) {
          paciente = PacienteModel.fromMap(pacienteParse.toJson());
        }

        _fichaModel = FichaModel.fromMap(ficha[0].toJson());
        _fichaModel!.id = ficha[0].objectId;
        _fichaModel!.paciente = paciente;
        print(paciente);
        _fichaModel!.observacoes = ficha[0].get<String>('observacoes');
        _fichaModel!.pressao = ficha[0].get<String>('pressao');
        _fichaModel!.temperatura = ficha[0].get<num>('temperatura').toDouble();
        _fichaModel!.peso = ficha[0].get<num>('peso').toDouble();
        _fichaModel!.altura = ficha[0].get<num>('altura').toDouble();
        _fichaModel!.medicacaoContinua =
            ficha[0].get<bool>('medicacao_continua') ?? false;
        _fichaModel!.historicoDoencasFamiliar =
            ficha[0].get<bool>('historico_doencias_familiar') ?? false;
        _fichaModel!.doencasPreexistentes =
            ficha[0].get<bool>('doencas_pre_existentes') ?? false;
        _fichaModel!.alergias = ficha[0].get<bool>('possui_alergias') ?? false;
        _fichaModel!.operado = ficha[0].get<bool>('operado') ?? false;
        prioridade = Prioridade.fromValor(ficha[0].get<int>('prioridade') ?? 4);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_fichaModel == null) {
      return Center(child: CircularProgressIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ficha do Paciente',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextOutput(
                      labelText: 'Paciente:',
                      value: '${paciente.nome}',
                      prefixIcon: Icons.person,
                    ),
                    SizedBox(height: 10),
                    Row(children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Prioridade.getColor(prioridade!),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            prioridade!.nome,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ]),
                  ],
                ),
                SizedBox(height: 15),
                MyTextOutput(
                  labelText: 'Paciente queixa:',
                  value: '${_fichaModel!.observacoes}',
                  prefixIcon: Icons.speaker_notes,
                ),
                MyTextOutput(
                  labelText: 'Pressão Arterial:',
                  value: '${_fichaModel!.pressao}',
                  prefixIcon: Icons.monitor_heart,
                ),
                MyTextOutput(
                  labelText: 'Temperatura:',
                  value: '${_fichaModel!.temperatura}°C',
                  prefixIcon: Icons.thermostat,
                ),
                MyTextOutput(
                  labelText: 'Peso:',
                  value: '${_fichaModel!.peso} kg',
                  prefixIcon: Icons.scale_rounded,
                ),
                MyTextOutput(
                  labelText: 'Altura:',
                  value: '${_fichaModel!.altura} cm',
                  prefixIcon: Icons.height,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyTextOutput(
                      labelText: 'Tem histórico de doenças familiar?',
                      value:
                          _fichaModel!.historicoDoencasFamiliar ? 'Sim' : 'Não',
                      prefixIcon: Icons.article,
                    ),
                    MyTextOutput(
                      labelText: 'Possui doenças preexistentes?',
                      value: _fichaModel!.doencasPreexistentes ? 'Sim' : 'Não',
                      prefixIcon: Icons.local_hospital,
                    ),
                    MyTextOutput(
                      labelText: 'Faz o uso de medicação contínua?',
                      value: _fichaModel!.medicacaoContinua ? 'Sim' : 'Não',
                      prefixIcon: Icons.medication,
                    ),
                    MyTextOutput(
                      labelText: 'Possui alergias?',
                      value: _fichaModel!.alergias ? 'Sim' : 'Não',
                      prefixIcon: Icons.sick,
                    ),
                    MyTextOutput(
                      labelText: 'Já fez alguma cirurgia?',
                      value: _fichaModel!.operado ? 'Sim' : 'Não',
                      prefixIcon: Icons.vaccines,
                    ),
                    MyTextInput(
                      hintText: "Observações do médico:",
                      obscureText: false,
                      controller: observacoesMedico,
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.notes,
                      enabled: true,
                      placeHolder: '',
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton(
                      buttonText: 'Encerrar',
                      onTapButton: () async {
                        final ParseObject ficha = ParseObject('ficha')
                          ..objectId = _fichaModel!.id
                          ..set('observacoes_medico', observacoesMedico.text)
                          ..set('prioridade', 8);

                        try {
                          await ficha.save();
                          displayDialog(
                            context,
                            'Ficha Encerrada com Sucesso!',
                            'Atenção:',
                            () => goToHome(context),
                          );
                          Navigator.of(context).pop;
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Erro ao encerrar ficha!')));
                        }
                      },
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      height: MediaQuery.of(context).size.height * 0.05,
                      width: MediaQuery.of(context).size.width * 0.3,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
