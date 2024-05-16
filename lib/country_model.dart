class Model {
  Name? name;
  List<String>? tld;
  String? cca2;
  String? ccn3;
  String? cca3;
  String? cioc;
  bool? independent;
  String? status;
  bool? unMember;
  Currencies? currencies;
  Idd? idd;
  List<String>? capital;
  List<String>? altSpellings;
  String? region;
  String? subregion;
  Languages? languages;
  Translations? translations;
  List<double>? latlng;
  bool? landlocked;
  List<String>? borders;
  double? area;
  Demonyms? demonyms;
  Maps? maps;
  int? population;
  Gini? gini;
  String? fifa;
  Car? car;
  List<String>? timezones;
  List<String>? continents;
  Flags? flags;
  CoatOfArms? coatOfArms;
  String? startOfWeek;
  CapitalInfo? capitalInfo;
  PostalCode? postalCode;

  Model({
    this.name,
    this.tld,
    this.cca2,
    this.ccn3,
    this.cca3,
    this.cioc,
    this.independent,
    this.status,
    this.unMember,
    this.currencies,
    this.idd,
    this.capital,
    this.altSpellings,
    this.region,
    this.subregion,
    this.languages,
    this.translations,
    this.latlng,
    this.landlocked,
    this.borders,
    this.area,
    this.demonyms,
    this.flags,
    this.maps,
    this.population,
    this.gini,
    this.fifa,
    this.car,
    this.timezones,
    this.continents,
    this.coatOfArms,
    this.startOfWeek,
    this.capitalInfo,
    this.postalCode,
  });

  Model.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? Name.fromJson(json['name']) : null;
    tld = json['tld'] != null ? List<String>.from(json['tld']) : null;
    cca2 = json['cca2'];
    ccn3 = json['ccn3'];
    cca3 = json['cca3'];
    cioc = json['cioc'];
    independent = json['independent'];
    status = json['status'];
    unMember = json['unMember'];
    currencies = json['currencies'] != null ? Currencies.fromJson(json['currencies']) : null;
    idd = json['idd'] != null ? Idd.fromJson(json['idd']) : null;
    capital = json['capital'] != null ? List<String>.from(json['capital']) : null;
    altSpellings = json['altSpellings'] != null ? List<String>.from(json['altSpellings']) : null;
    region = json['region'];
    subregion = json['subregion'];
    languages = json['languages'] != null ? Languages.fromJson(json['languages']) : null;
    translations = json['translations'] != null ? Translations.fromJson(json['translations']) : null;
    latlng = json['latlng'] != null ? List<double>.from(json['latlng']) : null;
    landlocked = json['landlocked'];
    borders = json['borders'] != null ? List<String>.from(json['borders']) : null;
    area = json['area']?.toDouble();
    demonyms = json['demonyms'] != null ? Demonyms.fromJson(json['demonyms']) : null;

    maps = json['maps'] != null ? Maps.fromJson(json['maps']) : null;
    population = json['population'];
    gini = json['gini'] != null ? Gini.fromJson(json['gini']) : null;
    fifa = json['fifa'];
    car = json['car'] != null ? Car.fromJson(json['car']) : null;
    timezones = json['timezones'] != null ? List<String>.from(json['timezones']) : null;
    continents = json['continents'] != null ? List<String>.from(json['continents']) : null;
    flags = json['flags'] != null ? Flags.fromJson(json['flags']) : null;
    coatOfArms = json['coatOfArms'] != null
        ? new CoatOfArms.fromJson(json['coatOfArms'])
        : null;
    startOfWeek = json['startOfWeek'];
    capitalInfo = json['capitalInfo'] != null ? CapitalInfo.fromJson(json['capitalInfo']) : null;
    postalCode = json['postalCode'] != null ? PostalCode.fromJson(json['postalCode']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (name != null) {
      data['name'] = name!.toJson();
    }
    data['tld'] = tld;
    data['cca2'] = cca2;
    data['ccn3'] = ccn3;
    data['cca3'] = cca3;
    data['cioc'] = cioc;
    data['independent'] = independent;
    data['status'] = status;
    data['unMember'] = unMember;
    if (currencies != null) {
      data['currencies'] = currencies!.toJson();
    }
    if (idd != null) {
      data['idd'] = idd!.toJson();
    }
    data['capital'] = capital;
    data['altSpellings'] = altSpellings;
    data['region'] = region;
    data['subregion'] = subregion;
    if (languages != null) {
      data['languages'] = languages!.toJson();
    }
    if (translations != null) {
      data['translations'] = translations!.toJson();
    }
    data['latlng'] = latlng;
    data['landlocked'] = landlocked;
    data['borders'] = borders;
    data['area'] = area;
    if (demonyms != null) {
      data['demonyms'] = demonyms!.toJson();
    }
    data['population'] = population;
    if (gini != null) {
      data['gini'] = gini!.toJson();
    }
    data['fifa'] = fifa;
    if (car != null) {
      data['car'] = car!.toJson();
    }
    data['timezones'] = timezones;
    data['continents'] = continents;
    data['flags'] = flags != null ? flags!.toJson() : null;
    if (coatOfArms != null) {
      data['coatOfArms'] = coatOfArms!.toJson();
    }
    data['startOfWeek'] = startOfWeek;
    if (capitalInfo != null) {
      data['capitalInfo'] = capitalInfo!.toJson();
    }
    if (postalCode != null) {
      data['postalCode'] = postalCode!.toJson();
    }
    return data;
  }
}

class CoatOfArms {
  String? png;
  String? svg;

  CoatOfArms({this.png, this.svg});

  CoatOfArms.fromJson(Map<String, dynamic> json) {
    png = json['png'];
    svg = json['svg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['png'] = this.png;
    data['svg'] = this.svg;
    return data;
  }
}


class Name {
  String? common;
  String? official;
  NativeName? nativeName;

  Name({this.common, this.official, this.nativeName});

  Name.fromJson(Map<String, dynamic> json) {
    common = json['common'];
    official = json['official'];
    nativeName = json['nativeName'] != null ? NativeName.fromJson(json['nativeName']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['common'] = common;
    data['official'] = official;
    if (nativeName != null) {
      data['nativeName'] = nativeName!.toJson();
    }
    return data;
  }
}

class NativeName {
  Ron? ron;

  NativeName({this.ron});

  NativeName.fromJson(Map<String, dynamic> json) {
    ron = json['ron'] != null ? Ron.fromJson(json['ron']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ron != null) {
      data['ron'] = ron!.toJson();
    }
    return data;
  }
}

class Ron {
  String? official;
  String? common;

  Ron({this.official, this.common});

  Ron.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}

class Currencies {
  MDL? mDL;

  Currencies({this.mDL});

  Currencies.fromJson(Map<String, dynamic> json) {
    mDL = json['MDL'] != null ? MDL.fromJson(json['MDL']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (mDL != null) {
      data['MDL'] = mDL!.toJson();
    }
    return data;
  }
}

class MDL {
  String? name;
  String? symbol;

  MDL({this.name, this.symbol});

  MDL.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    symbol = json['symbol'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['symbol'] = symbol;
    return data;
  }
}

class Idd {
  String? root;
  List<String>? suffixes;

  Idd({this.root, this.suffixes});

  Idd.fromJson(Map<String, dynamic> json) {
    root = json['root'];
    suffixes = json['suffixes'] != null ? List<String>.from(json['suffixes']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['root'] = root;
    data['suffixes'] = suffixes;
    return data;
  }
}

class Languages {
  String? ron;

  Languages({this.ron});

  Languages.fromJson(Map<String, dynamic> json) {
    ron = json['ron'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ron'] = ron;
    return data;
  }
}

class Translations {
  Ron? ara;
  Ron? bre;
  Ron? ces;
  Ron? cym;
  Ron? deu;
  Ron? est;
  Ron? fin;
  Eng? fra;
  Ron? hrv;
  Ron? hun;
  Ron? ita;
  Ron? jpn;
  Ron? kor;
  Ron? nld;
  Ron? per;
  Ron? pol;
  Ron? por;
  Ron? rus;
  Ron? slk;
  Ron? spa;
  Ron? srp;
  Ron? swe;
  Ron? tur;
  Ron? urd;
  Ron? zho;

  Translations({
    this.ara,
    this.bre,
    this.ces,
    this.cym,
    this.deu,
    this.est,
    this.fin,
    this.fra,
    this.hrv,
    this.hun,
    this.ita,
    this.jpn,
    this.kor,
    this.nld,
    this.per,
    this.pol,
    this.por,
    this.rus,
    this.slk,
    this.spa,
    this.srp,
    this.swe,
    this.tur,
    this.urd,
    this.zho,
  });

  Translations.fromJson(Map<String, dynamic> json) {
    ara = json['ara'] != null ? Ron.fromJson(json['ara']) : null;
    bre = json['bre'] != null ? Ron.fromJson(json['bre']) : null;
    ces = json['ces'] != null ? Ron.fromJson(json['ces']) : null;
    cym = json['cym'] != null ? Ron.fromJson(json['cym']) : null;
    deu = json['deu'] != null ? Ron.fromJson(json['deu']) : null;
    est = json['est'] != null ? Ron.fromJson(json['est']) : null;
    fin = json['fin'] != null ? Ron.fromJson(json['fin']) : null;
    fra = json['fra'] != null ? Eng.fromJson(json['fra']) : null;
    hrv = json['hrv'] != null ? Ron.fromJson(json['hrv']) : null;
    hun = json['hun'] != null ? Ron.fromJson(json['hun']) : null;
    ita = json['ita'] != null ? Ron.fromJson(json['ita']) : null;
    jpn = json['jpn'] != null ? Ron.fromJson(json['jpn']) : null;
    kor = json['kor'] != null ? Ron.fromJson(json['kor']) : null;
    nld = json['nld'] != null ? Ron.fromJson(json['nld']) : null;
    per = json['per'] != null ? Ron.fromJson(json['per']) : null;
    pol = json['pol'] != null ? Ron.fromJson(json['pol']) : null;
    por = json['por'] != null ? Ron.fromJson(json['por']) : null;
    rus = json['rus'] != null ? Ron.fromJson(json['rus']) : null;
    slk = json['slk'] != null ? Ron.fromJson(json['slk']) : null;
    spa = json['spa'] != null ? Ron.fromJson(json['spa']) : null;
    srp = json['srp'] != null ? Ron.fromJson(json['srp']) : null;
    swe = json['swe'] != null ? Ron.fromJson(json['swe']) : null;
    tur = json['tur'] != null ? Ron.fromJson(json['tur']) : null;
    urd = json['urd'] != null ? Ron.fromJson(json['urd']) : null;
    zho = json['zho'] != null ? Ron.fromJson(json['zho']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (ara != null) {
      data['ara'] = ara!.toJson();
    }
    if (bre != null) {
      data['bre'] = bre!.toJson();
    }
    if (ces != null) {
      data['ces'] = ces!.toJson();
    }
    if (cym != null) {
      data['cym'] = cym!.toJson();
    }
    if (deu != null) {
      data['deu'] = deu!.toJson();
    }
    if (est != null) {
      data['est'] = est!.toJson();
    }
    if (fin != null) {
      data['fin'] = fin!.toJson();
    }
    if (fra != null) {
      data['fra'] = fra!.toJson();
    }
    if (hrv != null) {
      data['hrv'] = hrv!.toJson();
    }
    if (hun != null) {
      data['hun'] = hun!.toJson();
    }
    if (ita != null) {
      data['ita'] = ita!.toJson();
    }
    if (jpn != null) {
      data['jpn'] = jpn!.toJson();
    }
    if (kor != null) {
      data['kor'] = kor!.toJson();
    }
    if (nld != null) {
      data['nld'] = nld!.toJson();
    }
    if (per != null) {
      data['per'] = per!.toJson();
    }
    if (pol != null) {
      data['pol'] = pol!.toJson();
    }
    if (por != null) {
      data['por'] = por!.toJson();
    }
    if (rus != null) {
      data['rus'] = rus!.toJson();
    }
    if (slk != null) {
      data['slk'] = slk!.toJson();
    }
    if (spa != null) {
      data['spa'] = spa!.toJson();
    }
    if (srp != null) {
      data['srp'] = srp!.toJson();
    }
    if (swe != null) {
      data['swe'] = swe!.toJson();
    }
    if (tur != null) {
      data['tur'] = tur!.toJson();
    }
    if (urd != null) {
      data['urd'] = urd!.toJson();
    }
    if (zho != null) {
      data['zho'] = zho!.toJson();
    }
    return data;
  }
}

class Eng {
  String? official;
  String? common;

  Eng({this.official, this.common});

  Eng.fromJson(Map<String, dynamic> json) {
    official = json['official'];
    common = json['common'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['official'] = official;
    data['common'] = common;
    return data;
  }
}

class Demonyms {
  Eng? eng;

  Demonyms({this.eng});

  Demonyms.fromJson(Map<String, dynamic> json) {
    eng = json['eng'] != null ? Eng.fromJson(json['eng']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (eng != null) {
      data['eng'] = eng!.toJson();
    }
    return data;
  }
}

class Flags {
  String? emoji;
  String? emojiUnicode;
  String? svg;

  Flags({this.emoji, this.emojiUnicode, this.svg});

  factory Flags.fromJson(Map<String, dynamic> json) {
    return Flags(
      emoji: json['emoji'],
      emojiUnicode: json['emojiUnicode'],
      svg: json['svg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['emoji'] = emoji;
    data['emojiUnicode'] = emojiUnicode;
    data['svg'] = svg;
    return data;
  }
}


class Maps {
  String? googleMaps;
  String? openStreetMaps;

  Maps({this.googleMaps, this.openStreetMaps});

  Maps.fromJson(Map<String, dynamic> json) {
    googleMaps = json['googleMaps'];
    openStreetMaps = json['openStreetMaps'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['googleMaps'] = googleMaps;
    data['openStreetMaps'] = openStreetMaps;
    return data;
  }
}

class Gini {
  double? inequality;

  Gini({this.inequality});

  Gini.fromJson(Map<String, dynamic> json) {
    inequality = json['inequality']?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['inequality'] = inequality;
    return data;
  }
}

class Car {
  String? sign;

  Car({this.sign});

  Car.fromJson(Map<String, dynamic> json) {
    sign = json['sign'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sign'] = sign;
    return data;
  }
}

class CapitalInfo {
  List<double>? latlng;

  CapitalInfo({this.latlng});

  CapitalInfo.fromJson(Map<String, dynamic> json) {
    final latlngList = json['latlng'];
    latlng = latlngList != null ? List<double>.from(latlngList) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['latlng'] = latlng;
    return data;
  }
}
class PostalCode {
  String? format;

  PostalCode({this.format});

  PostalCode.fromJson(Map<String, dynamic> json) {
    format = json['format'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['format'] = format;
    return data;
  }
}

