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
  const senhaPattern =
      r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';
  if (!RegExp(senhaPattern).hasMatch(senha)) {
    return 'A senha deve ter pelo menos 8 caracteres, conter números e caracteres especiais.';
  }
  return null;
}

String? validarCpf(String cpf) {
  if (!RegExp(r'^\d{11}$').hasMatch(cpf)) {
    return 'O CPF deve conter 11 dígitos numéricos';
  }
  return null;
}
