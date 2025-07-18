import 'package:app_queue/controller/ficha/ficha_controller.dart';
import 'package:app_queue/model/ficha/Prioridade.dart';
import 'package:app_queue/model/ficha/ficha_model.dart';
import 'package:app_queue/model/paciente_model.dart';
import 'package:app_queue/validator/validators.dart';
import 'package:app_queue/view/components/my_button.dart';
import 'package:app_queue/view/components/my_checkBox.dart';
import 'package:app_queue/view/components/my_dropdown.dart';
import 'package:app_queue/view/components/my_text_input.dart';
import 'package:app_queue/view/helpers/interface_helpers.dart';
import 'package:app_queue/view/helpers/route_helpers.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Triagem extends StatefulWidget {
  const Triagem({super.key});

  @override
  _TriagemState createState() => _TriagemState();
}

class _TriagemState extends State<Triagem> {
  bool hasFamilyHistory = false;
  bool hasPreExistingConditions = false;
  bool usesContinuousMedication = false;
  bool hasAllergies = false;
  bool hasHadSurgery = false;
  late FichaModel _fichaAtual;
  String? nomePaciente;
  late PacienteModel pacienteModel;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController queixaController = TextEditingController();
  final TextEditingController pressaoArterialController =
      TextEditingController();
  final TextEditingController temperaturaController = TextEditingController();
  final TextEditingController pesoController = TextEditingController();
  final TextEditingController alturaController = TextEditingController();

  final FichaController _fichaController = FichaController();

  String selectedPriority = 'Selecione a prioridade';

  @override
  void initState() {
    super.initState();
    setNomePaciente();
  }

  void setNomePaciente() async {
    List<ParseObject> fichas =
        await _fichaController.getFichasDoDiaEnfermeiro();

    if (!mounted)
      return; // Evita erro se o widget for desmontado antes da atualização

    if (fichas.isNotEmpty) {
      ParseObject ficha = fichas.first;
      ParseObject? paciente = ficha.get<ParseObject>('paciente');

      if (paciente != null) {
        nomePaciente = paciente.get<String>('name') ?? 'Paciente Desconhecido';
        pacienteModel = PacienteModel.fromParse(paciente);
        _fichaAtual = FichaModel.fromParseObject(fichas.first);
      } else {
        nomePaciente = '--';
      }
    } else {
      nomePaciente = 'Nenhum paciente na fila';

      // Garante que o diálogo só será mostrado após o build
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          displayDialog(context, 'Nenhum Paciente na fila', 'Atenção!',
              () => goToHome(context));
        }
      });
    }

    if (mounted) {
      setState(() {}); // Atualiza a UI após obter os dados
    }
  }

  @override
  Widget build(BuildContext context) {
    if (nomePaciente == null)
      return const Center(child: CircularProgressIndicator());

    if (nomePaciente == 'Nenhum paciente na fila')
      return const Center(child: Text('Nenhum Paciente na fila'));

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          Form(
            key: _formKey,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Triagem',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Paciente: $nomePaciente',
                        style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).colorScheme.onSecondary,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  MyTextInput(
                      hintText: 'Paciente queixa:',
                      obscureText: false,
                      controller: queixaController,
                      validator: (value) => Validators.validarCampoObrigatorio(value, 'Queixa'),
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.speaker_notes,
                      enabled: true,
                      placeHolder: ''),
                  MyTextInput(
                      hintText: 'Pressão Arterial:',
                      obscureText: false,
                      controller: pressaoArterialController,
                      validator: (value) => validarCampoDeTexto(value),
                      keyboardType: TextInputType.text,
                      prefixIcon: Icons.format_shapes,
                      enabled: true,
                      placeHolder: ''),
                  MyTextInput(
                      hintText: 'Temperatura:',
                      obscureText: false,
                      controller: temperaturaController,
                      validator: (value) => validarCampoDeTexto(value),
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.thermostat,
                      enabled: true,
                      placeHolder: ''),
                  MyTextInput(
                      hintText: 'Peso:',
                      obscureText: false,
                      controller: pesoController,
                      validator: (value) => validarCampoDeTexto(value),
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.line_weight,
                      enabled: true,
                      placeHolder: ''),
                  MyTextInput(
                      hintText: 'Altura (cm):',
                      obscureText: false,
                      controller: alturaController,
                      validator: (value) => validarCampoDeTexto(value),
                      keyboardType: TextInputType.number,
                      prefixIcon: Icons.height,
                      enabled: true,
                      placeHolder: ''),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Tem histórico de doenças familiar?'),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          MyCheckbox(
                            text: 'Sim',
                            initialValue: hasFamilyHistory,
                            onChanged: (value) {
                              setState(() {
                                hasFamilyHistory = true;
                              });
                            },
                          ),
                          MyCheckbox(
                            text: 'Não',
                            initialValue: !hasFamilyHistory,
                            onChanged: (value) {
                              setState(() {
                                hasFamilyHistory = false;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Possui doenças preexistentes?'),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          MyCheckbox(
                            text: 'Sim',
                            initialValue: hasPreExistingConditions,
                            onChanged: (value) {
                              setState(() {
                                hasPreExistingConditions = true;
                              });
                            },
                          ),
                          MyCheckbox(
                            text: 'Não',
                            initialValue: !hasPreExistingConditions,
                            onChanged: (value) {
                              setState(() {
                                hasPreExistingConditions = false;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Faz uso de medicação contínua?'),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          MyCheckbox(
                            text: 'Sim',
                            initialValue: usesContinuousMedication,
                            onChanged: (value) {
                              setState(() {
                                usesContinuousMedication = true;
                              });
                            },
                          ),
                          MyCheckbox(
                            text: 'Não',
                            initialValue: !usesContinuousMedication,
                            onChanged: (value) {
                              setState(() {
                                usesContinuousMedication = false;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Possui alergias?'),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          MyCheckbox(
                            text: 'Sim',
                            initialValue: hasAllergies,
                            onChanged: (value) {
                              setState(() {
                                hasAllergies = true;
                              });
                            },
                          ),
                          MyCheckbox(
                            text: 'Não',
                            initialValue: !hasAllergies,
                            onChanged: (value) {
                              setState(() {
                                hasAllergies = false;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Já fez alguma cirurgia?'),
                      SizedBox(width: 20),
                      Row(
                        children: [
                          MyCheckbox(
                            text: 'Sim',
                            initialValue: hasHadSurgery,
                            onChanged: (value) {
                              setState(() {
                                hasHadSurgery = true;
                              });
                            },
                          ),
                          MyCheckbox(
                            text: 'Não',
                            initialValue: !hasHadSurgery,
                            onChanged: (value) {
                              setState(() {
                                hasHadSurgery = false;
                              });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Prioridade (protocolo Manchester):'),
                      SizedBox(
                        width: 20,
                      ),
                      MyDropdown(
                        selectedValue: selectedPriority,
                        onChanged: (String? value) {
                          setState(() {
                            selectedPriority = value!;
                          });
                        },
                        items: [
                          'Selecione a prioridade',
                          'Não urgente',
                          'Pouco urgente',
                          'Urgente',
                          'Muito urgente',
                          'Emergência',
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      MyButton(
                        buttonText: 'Salvar',
                        onTapButton: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _salvarFicha();
                          }
                        },
                        backgroundColor: Colors.red,
                        textColor: Colors.white,
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  _salvarFicha() async {
    var temperatura = double.tryParse(temperaturaController.text);
    var peso = double.tryParse(pesoController.text);
    var altura = double.tryParse(alturaController.text);

    _fichaAtual.paciente = pacienteModel;
    _fichaAtual.prioridade = Prioridade.fromNome(selectedPriority);
    _fichaAtual.medicacaoContinua = usesContinuousMedication;
    _fichaAtual.observacoes = queixaController.text;
    _fichaAtual.pressao = pressaoArterialController.text;
    _fichaAtual.temperatura = temperatura!;
    _fichaAtual.peso = peso!;
    _fichaAtual.altura = altura!;
    _fichaAtual.historicoDoencasFamiliar = hasFamilyHistory;
    _fichaAtual.doencasPreexistentes = hasPreExistingConditions;
    _fichaAtual.alergias = hasAllergies;
    _fichaAtual.operado = hasHadSurgery;

    var response = await _fichaController.editFicha(_fichaAtual);

    if (response == true) {
      displayDialog(
        context,
        'Ficha do Paciente Cadastrada Com Sucesso!',
        'Atenção:',
        () => goToHome(context),
      );
      Navigator.pop(context);
    }
  }
}
