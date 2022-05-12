class Initialises {
  Initialises(var locationData) {
    if (locationData != null) {
      temp = locationData["main"]["temp"];
      country = locationData["sys"]["country"];
      city = locationData["name"];
      status = locationData["weather"][0]["main"];
      name = locationData["name"];
      dec = locationData["weather"][0]["description"];
      condition = locationData["weather"][0]["id"];
    } else {
      temp = 0.0;
      country = "not found";
      city = "not found";
      status = "not found";
      name = "not found";
      dec = "not found";
      condition = 0;
    }
  }

  double? temp;
  String? city;
  String? dec;
  String? status;
  String? name;
  String? weader;
  String? country;
  int? condition;
}
