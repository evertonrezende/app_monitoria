class Metrica {
  String periodo;
  double valor;  

  Metrica(this.periodo, this.valor);

  Metrica.fromJson(Map<String,dynamic> map): 
      periodo = map["periodo"],
      valor = map["valor"];
}