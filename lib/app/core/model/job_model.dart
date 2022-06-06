class JobModel {
  bool? success;
  Data? data;
  MinVersion? minVersion;

  JobModel({this.success, this.data, this.minVersion});

  JobModel.fromJson(Map<String, dynamic> json) {
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
  List<Jobs>? jobs;
  bool? isExpandedSearch;
  String? lowestValue;
  String? highestValue;

  Data({this.jobs, this.isExpandedSearch, this.lowestValue, this.highestValue});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['jobs'] != null) {
      jobs = <Jobs>[];
      json['jobs'].forEach((v) {
        jobs!.add(new Jobs.fromJson(v));
      });
    }
    isExpandedSearch = json['is_expanded_search'];
    lowestValue = json['lowest_value'];
    highestValue = json['highest_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.jobs != null) {
      data['jobs'] = this.jobs!.map((v) => v.toJson()).toList();
    }
    data['is_expanded_search'] = this.isExpandedSearch;
    data['lowest_value'] = this.lowestValue;
    data['highest_value'] = this.highestValue;
    return data;
  }
}

class Jobs {
  int? id;
  String? title;
  Profession? profession;
  Specialty? specialty;
  String? value;
  String? valuePeriod;
  Clinic? clinic;

  Jobs(
      {this.id,
      this.title,
      this.profession,
      this.specialty,
      this.value,
      this.valuePeriod,
      this.clinic});

  Jobs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    profession = json['profession'] != null
        ? new Profession.fromJson(json['profession'])
        : null;
    specialty = json['specialty'] != null
        ? new Specialty.fromJson(json['specialty'])
        : null;
    value = json['value'];
    valuePeriod = json['value_period'];
    clinic =
        json['clinic'] != null ? new Clinic.fromJson(json['clinic']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    if (this.profession != null) {
      data['profession'] = this.profession!.toJson();
    }
    if (this.specialty != null) {
      data['specialty'] = this.specialty!.toJson();
    }
    data['value'] = this.value;
    data['value_period'] = this.valuePeriod;
    if (this.clinic != null) {
      data['clinic'] = this.clinic!.toJson();
    }
    return data;
  }
}

class Profession {
  int? professionId;
  String? name;

  Profession({this.professionId, this.name});

  Profession.fromJson(Map<String, dynamic> json) {
    professionId = json['profession_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['profession_id'] = this.professionId;
    data['name'] = this.name;
    return data;
  }
}

class Specialty {
  int? specialtyId;
  String? name;

  Specialty({this.specialtyId, this.name});

  Specialty.fromJson(Map<String, dynamic> json) {
    specialtyId = json['specialty_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['specialty_id'] = this.specialtyId;
    data['name'] = this.name;
    return data;
  }
}

class Clinic {
  int? id;
  String? name;
  String? clinicType;
  String? city;
  String? state;
  String? image;

  Clinic(
      {this.id, this.name, this.clinicType, this.city, this.state, this.image});

  Clinic.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    clinicType = json['clinic_type'];
    city = json['city'];
    state = json['state'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['clinic_type'] = this.clinicType;
    data['city'] = this.city;
    data['state'] = this.state;
    data['image'] = this.image;
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