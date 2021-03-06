import 'package:flutter/material.dart';
import 'package:cities_manager/entities/city.dart';
import 'package:cities_manager/repositories/city_repository.dart';
import 'package:cities_manager/widgets/city_form.dart';

class CreateCityPage extends StatefulWidget {
  @override
  _CreateCityPageState createState() => _CreateCityPageState();
}

class _CreateCityPageState extends State<CreateCityPage> {
  final _cityRepository = CityRepository();

  void _handleFormSubmit({ String name, String uf }) async {
    final city = City(name: name, uf: uf);
    await _cityRepository.store(city);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Cidade'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: CityForm(handleFormSubmit: _handleFormSubmit),
      ),
    );
  }
}
