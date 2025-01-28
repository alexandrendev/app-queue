enum Cargo {
  atendente(1, 'Atendente'),
  enfermeiro(2, 'Enfermeiro'),
  medico(3, 'Médico');

  final int valor;
  final String nome;

  const Cargo(this.valor, this.nome);

  static Cargo fromValor(int valor) {
    return Cargo.values.firstWhere(
      (cargo) => cargo.valor == valor,
      orElse: () => Cargo.atendente,
    );
  }

  static Cargo fromNome(String nome) {
    return Cargo.values.firstWhere(
      (cargo) => cargo.nome == nome,
      orElse: () => Cargo.atendente,
    );
  }
}
