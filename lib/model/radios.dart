
class Radios {

  String name;
  String radio_url;

	Radios.fromJsonMap(Map<String, dynamic> map): 
		name = map["name"],
		radio_url = map["radio_url"];

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['name'] = name;
		data['radio_url'] = radio_url;
		return data;
	}
}
