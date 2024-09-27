class AddressModel {
  final String cep;
  final String logradouro;
  final String bairro;
  final String localidade;
  final String uf;
  final String? number;
  final String? complement;

  AddressModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
    required this.localidade,
    required this.uf,
    this.number,
    this.complement,
  });

  // Factory para criar uma instância do modelo a partir de um JSON
  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      cep: json['cep'] ?? '',
      logradouro: json['logradouro'] ?? '',
      bairro: json['bairro'] ?? '',
      localidade: json['localidade'] ?? '',
      uf: json['uf'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'number': number,
      'complement': complement,
    };
  }

  // Método que retorna o endereço formatado como uma string
  String get formattedAddress => '$logradouro, $bairro, $localidade - $uf';
}
