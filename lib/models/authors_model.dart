
class Authors{
  String? name;
  String? institution;

  Authors({this.name, this.institution});

  factory Authors.fromJson(Map<String, dynamic> json) => Authors(
    name: json["authorsName"],
    institution: json["authorsInstitution"],
  );

  Map<String, dynamic> toJson(Authors auth) => {
    'authorsName': auth.name,
    'authorsInstitution': auth.institution,
  };

}