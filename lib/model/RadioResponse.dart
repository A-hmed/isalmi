

import 'package:islami_app_mon/model/radios.dart';

class RadioResponse {

  List<Radios> radios;

	RadioResponse.fromJsonMap(Map<String, dynamic> map): 
		radios = List<Radios>.from(map["radios"].map((it) => Radios.fromJsonMap(it)));

	Map<String, dynamic> toJson() {
		final Map<String, dynamic> data = new Map<String, dynamic>();
		data['radios'] = radios != null ? 
			this.radios.map((v) => v.toJson()).toList()
			: null;
		return data;
	}
}
