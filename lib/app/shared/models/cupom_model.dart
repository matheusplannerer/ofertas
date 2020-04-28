class CupomModel {
  bool isPercentage;
  bool isAbsolut;
  int value;

  CupomModel({this.isAbsolut, this.isPercentage, this.value});

  factory CupomModel.fromJson(Map<String, dynamic> json) {
    return CupomModel(
      isAbsolut: json['isAbsolut'],
      isPercentage: json['isPercentage'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() => {
        'isAbsolut': isAbsolut,
        'isPercentage': isPercentage,
        'value': value,
      };
}
