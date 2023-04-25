class Medication {
  int? id;
  String? name;
  String? description;
  String? dosage;

  Medication({this.id, this.name, this.description, this.dosage});

  Medication.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    description = map['description'];
    dosage = map['dosage'];
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (id != null) data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['dosage'] = dosage;
    return data;
  }

}
