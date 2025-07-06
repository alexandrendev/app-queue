class Validators {
  static String? validarEmail(String? email) {
    if (email == null || email.trim().isEmpty) {
      return 'Email é obrigatório';
    }
    
    const emailPattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    if (!RegExp(emailPattern).hasMatch(email.trim())) {
      return 'Por favor, insira um email válido';
    }
    return null;
  }

  static String? validarSenha(String? senha) {
    if (senha == null || senha.isEmpty) {
      return 'Senha é obrigatória';
    }
    
    if (senha.length < 6) {
      return 'Senha deve ter pelo menos 6 caracteres';
    }
    
    return null;
  }

  static String? validarCpf(String? cpf) {
    if (cpf == null || cpf.isEmpty) {
      return 'CPF é obrigatório';
    }
    
    // Remove formatação
    final cpfLimpo = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    
    if (cpfLimpo.length != 11) {
      return 'CPF deve conter 11 dígitos';
    }
    
    // Verifica se todos os dígitos são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(cpfLimpo)) {
      return 'CPF inválido';
    }
    
    return null;
  }

  static String? validarCampoObrigatorio(String? texto, [String? nomeCampo]) {
    if (texto == null || texto.trim().isEmpty) {
      return '${nomeCampo ?? 'Campo'} é obrigatório';
    }
    return null;
  }

  static String? validarTelefone(String? telefone) {
    if (telefone == null || telefone.isEmpty) {
      return 'Telefone é obrigatório';
    }
    
    // Remove formatação
    final telefoneLimpo = telefone.replaceAll(RegExp(r'[^0-9]'), '');
    
    if (telefoneLimpo.length < 10 || telefoneLimpo.length > 11) {
      return 'Telefone deve ter 10 ou 11 dígitos';
    }
    
    return null;
  }

  static String? validarNome(String? nome) {
    if (nome == null || nome.trim().isEmpty) {
      return 'Nome é obrigatório';
    }
    
    if (nome.trim().length < 2) {
      return 'Nome deve ter pelo menos 2 caracteres';
    }
    
    return null;
  }
}
