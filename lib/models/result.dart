
class Result {
  String? city;
  String? cityIbgeCode;
  int? confirmed;
  double? confirmedPer100kInhabitants;
  String? date;
  double? deathRate;
  int? deaths;
  int? estimatedPopulation;
  int? estimatedPopulation2019;
  bool? isLast;
  int? orderForPlace;
  String? placeType;
  String? state;

  Result(
      {this.city,
      this.cityIbgeCode,
      this.confirmed,
      this.confirmedPer100kInhabitants,
      this.date,
      this.deathRate,
      this.deaths,
      this.estimatedPopulation,
      this.estimatedPopulation2019,
      this.isLast,
      this.orderForPlace,
      this.placeType,
      this.state});

  Result.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    cityIbgeCode = json['city_ibge_code'];
    confirmed = json['confirmed'];
    confirmedPer100kInhabitants = json['confirmed_per_100k_inhabitants'];
    date = json['date'];
    deathRate = json['death_rate'];
    deaths = json['deaths'];
    estimatedPopulation = json['estimated_population'];
    estimatedPopulation2019 = json['estimated_population_2019'];
    isLast = json['is_last'];
    orderForPlace = json['order_for_place'];
    placeType = json['place_type'];
    state = json['state'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = city;
    data['city_ibge_code'] = cityIbgeCode;
    data['confirmed'] = confirmed;
    data['confirmed_per_100k_inhabitants'] = confirmedPer100kInhabitants;
    data['date'] = date;
    data['death_rate'] = deathRate;
    data['deaths'] = deaths;
    data['estimated_population'] = estimatedPopulation;
    data['estimated_population_2019'] = estimatedPopulation2019;
    data['is_last'] = isLast;
    data['order_for_place'] = orderForPlace;
    data['place_type'] = placeType;
    data['state'] = state;
    return data;
  }

//buscar descricao das constantes
  static String getStateText(String status) {
    switch (status) {
      case "AC":
        return 'Acre';
      case "AL":
        return 'Alagoas';
      case "AM":
        return 'Amazonas';
      case "AP":
        return 'Amapá';
      case "BA":
        return 'Bahia';
      case "CE":
        return 'Bahia';
      case "ES":
        return 'Espírito Santo';
      case "GO":
        return 'Goiás';
      case "MA":
        return 'Maranhão';
      case "MT":
        return 'Mato Grosso';
      case "MS":
        return 'Mato Grosso do Sul';
      case "MG":
        return 'Minas Gerais';
      case "PA":
        return 'Pará';
      case "PB":
        return 'Paraíba';
      case "PR":
        return 'Paraná';
      case "PE":
        return 'Pernambuco';
      case "PI":
        return 'Piauí';
      case "RJ":
        return 'Rio de Janeiro';
      case "RN":
        return 'Rio Grande do Norte';
      case "RS":
        return 'Rio Grande do Sul';
      case "RO":
        return 'Rondônia';
      case "SC":
        return 'Santa Catarina';
      case "SP":
        return 'São Paulo';
      case "SE":
        return 'Sergipe';
      case "TO":
        return 'Tocantins';
      case "DF":
        return 'Distrito Federal';

      default:
        return '';
    }
  }

  @override
  String toString() {
    return 'Result{city: $city, cityIbgeCode: $cityIbgeCode, confirmed: $confirmed, confirmedPer100kInhabitants: $confirmedPer100kInhabitants, date: $date, deathRate: $deathRate, deaths: $deaths, estimatedPopulation: $estimatedPopulation, estimatedPopulation2019: $estimatedPopulation2019, isLast: $isLast, orderForPlace: $orderForPlace, placeType: $placeType, state: $state}';
  }
}
