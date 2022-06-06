class ProfessionModel {
  bool? success;
  Data? data;
  MinVersion? minVersion;

  ProfessionModel({this.success, this.data, this.minVersion});

  ProfessionModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    minVersion = json['min_version'] != null
        ? new MinVersion.fromJson(json['min_version'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (this.minVersion != null) {
      data['min_version'] = this.minVersion!.toJson();
    }
    return data;
  }
}

class Data {
  List<Professions>? professions;

  Data({this.professions});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['professions'] != null) {
      professions = <Professions>[];
      json['professions'].forEach((v) {
        professions!.add(new Professions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.professions != null) {
      data['professions'] = this.professions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Professions {
  int? id;
  String? name;
  String? pluralName;
  String? classEntity;
  String? colorTop;
  String? colorBottom;

  Professions(
      {this.id,
      this.name,
      this.pluralName,
      this.classEntity,
      this.colorTop,
      this.colorBottom});

  Professions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    pluralName = json['plural_name'];
    classEntity = json['class_entity'];
    colorTop = json['color_top'];
    colorBottom = json['color_bottom'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['plural_name'] = this.pluralName;
    data['class_entity'] = this.classEntity;
    data['color_top'] = this.colorTop;
    data['color_bottom'] = this.colorBottom;
    return data;
  }
}

class MinVersion {
  String? ios;
  String? android;

  MinVersion({this.ios, this.android});

  MinVersion.fromJson(Map<String, dynamic> json) {
    ios = json['ios'];
    android = json['android'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ios'] = this.ios;
    data['android'] = this.android;
    return data;
  }
}