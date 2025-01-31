String? validarEmail(String? email) {
  const emailPattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  if (!RegExp(emailPattern).hasMatch(email!)) {
    return 'Por favor, insira um email válido';
  }
  return null;
}

/* Requisitos:
  - Deve conter pelo menos 8 caracteres
  - Somente letras e números
  - Deve conter pelo menos um número
  - Deve conter caracteres especiales: !@#$%^&*()_+
 */
String? validarSenha(String senha) {
  const senhaPattern = r'^.{8}$';
  if (!RegExp(senhaPattern).hasMatch(senha)) {
    return 'Senha muito curta ou inválida';
  }
  return null;
}

String? validarCpf(String cpf) {
  if (!RegExp(r'^\d{11}$').hasMatch(cpf)) {
    return 'O CPF deve conter 11 dígitos numéricos';
  }
  return null;
}

String? validarCampoDeTexto(String? texto) {
  if (texto == null || texto.isEmpty) {
    return 'Campo obrigatório';
  }
  return null;
}

String? validarTelefone(String? telefone) {
  const telefonePattern = r'^\d{10,15}$';
  if (!RegExp(telefonePattern).hasMatch(telefone!)) {
    return 'Telefone inválido';
  }
  return null;
}
