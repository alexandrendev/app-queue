import 'package:app_queue/model/ficha/Prioridade.dart';
import 'package:app_queue/model/ficha/ficha_model.dart';
import 'package:app_queue/model/paciente_model.dart';
import 'package:app_queue/view/components/my_button.dart';
import 'package:app_queue/view/helpers/interface_helpers.dart';
import 'package:flutter/material.dart';
import 'package:app_queue/controller/ficha/ficha_controller.dart';
import 'package:app_queue/view/components/my_text_input.dart';
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
                    Text(
                      'Paciente: ${paciente.nome}',
                      style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.onSecondary,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 20),
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
                MyTextInput(
                    hintText: 'Paciente queixa:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.speaker_notes,
                    enabled: false,
                    placeHolder: '${_fichaModel!.observacoes}'),
                MyTextInput(
                    hintText: 'Pressão Arterial:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.monitor_heart,
                    enabled: false,
                    placeHolder: '${_fichaModel!.pressao}'),
                MyTextInput(
                    hintText: 'Temperatura:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.thermostat,
                    enabled: false,
                    placeHolder: '${_fichaModel!.temperatura}°C'),
                MyTextInput(
                    hintText: 'Peso:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.scale_rounded,
                    enabled: false,
                    placeHolder: '${_fichaModel!.peso} kg'),
                MyTextInput(
                    hintText: 'Altura:',
                    obscureText: false,
                    controller: TextEditingController(),
                    validator: null,
                    keyboardType: TextInputType.text,
                    prefixIcon: Icons.height,
                    enabled: false,
                    placeHolder: '${_fichaModel!.altura} cm'),
                // SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(),
                    SizedBox(width: 20),
                    MyTextInput(
                      hintText: 'Tem histórico de doenças familiar?',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.article,
                      enabled: false,
                      placeHolder:
                          '${_fichaModel!.historicoDoencasFamiliar ? 'Sim' : 'Não'}',
                    ),
                    MyTextInput(
                      hintText: 'Possui doenças preexistentes?',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.local_hospital,
                      enabled: false,
                      placeHolder:
                          '${_fichaModel!.doencasPreexistentes ? 'Sim' : 'Não'}',
                    ),
                    MyTextInput(
                      hintText: 'Faz o uso de medicação contínua?',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.medication,
                      enabled: false,
                      placeHolder:
                          '${_fichaModel!.medicacaoContinua ? 'Sim' : 'Não'}',
                    ),
                    MyTextInput(
                      hintText: 'Possui alergias?',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.sick,
                      enabled: false,
                      placeHolder: '${_fichaModel!.alergias ? 'Sim' : 'Não'}',
                    ),
                    MyTextInput(
                      hintText: 'Já fez alguma cirurgia?',
                      obscureText: false,
                      controller: TextEditingController(),
                      validator: null,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.vaccines,
                      enabled: false,
                      placeHolder: '${_fichaModel!.operado ? 'Sim' : 'Não'}',
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
                          ..set('prioridade', 8);

                        try {
                          await ficha.save();
                          displayDialog(context, 'Ficha Encerrada com Sucesso!',
                              'Atenção:');
                          // Navigator.pop(context);
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
