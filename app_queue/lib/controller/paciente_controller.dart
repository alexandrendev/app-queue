import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class PacienteController {
  late String error;

  Future<bool> savePaciente(
    TextEditingController nameController,
    TextEditingController cpfController,
    TextEditingController phoneController,
    TextEditingController parentNameController,
    TextEditingController addressController,
  ) async {
    final String name = nameController.text.trim();
    final String cpf = cpfController.text.trim();
    final String phone = phoneController.text.trim();
    final String parentName = parentNameController.text.trim();
    final String address = addressController.text.trim();

    final ParseObject paciente = ParseObject('paciente')
      ..set('name', name)
      ..set('cpf', cpf)
      ..set('phone', [phone])
      ..set('parentName', parentName)
      ..set('address', [address]);

    try {
      await paciente.save();
      return true;
    } catch (e) {
      error = e.toString();
      return false;
    }
  }
}
