import 'package:flutter/material.dart';
import 'package:weather_app/source/network/mqtt_service.dart';
import 'package:weather_icons/weather_icons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _WeatherView();
  }
}

class _WeatherView extends StatefulWidget {
  const _WeatherView({
    super.key,
  });

  @override
  State<_WeatherView> createState() => _WeatherViewState();
}

class _WeatherViewState extends State<_WeatherView> {

  late MqttService _service;
  double _temp = 0;

  @override
  void initState() {
    super.initState();

    _service = MqttService('broker.emqx.io');
    
    _service.obtenerTemperaturaStream().listen((temp) {
      setState(() {
        _temp = temp;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge?.copyWith(
      color: Colors.white
    );

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Dolores Hidalgo C.I.N', style: titleStyle),
          const SizedBox(height: 20),
          Text('$_temp °C',
            style: const TextStyle(
            color: Colors.white,
            fontSize: 70,
            fontWeight: FontWeight.w400
          )),
          const BoxedIcon(
            WeatherIcons.day_cloudy,
            color: Colors.white,
            size: 90),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade800.withOpacity(0.5),
                borderRadius: const BorderRadius.all(Radius.circular(5))
              ),
              child: const Row(
                children: [
                _CustomCard(dia: 'lun.', icon:  WeatherIcons.day_fog, tmp: 20.0),
                _CustomCard(dia: 'mar.', icon: WeatherIcons.storm_showers, tmp: 15.4),
                _CustomCard(dia: 'miér.', icon: WeatherIcons.day_thunderstorm, tmp: 16.8),
                _CustomCard(dia: 'juev.', icon: WeatherIcons.smog, tmp: 23.3),
                _CustomCard(dia: 'vier.', icon: WeatherIcons.snow, tmp: 5.7),
                _CustomCard(dia: 'sab.', icon: WeatherIcons.meteor, tmp: 50.6),
                _CustomCard(dia: 'dom.', icon: WeatherIcons.sunset, tmp: 21.4),  
              ],),
            ),
          )
        ],
      ),
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String dia;
  final IconData icon;
  final double tmp;

  const _CustomCard({
    required this.dia,
    required this.icon,
    required this.tmp
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(height: 10),
          Text(
            dia,
            style: const TextStyle(
              color: Colors.white)
          ),
          BoxedIcon(icon,
          color: Colors.white,
          size: 20),
          const SizedBox(height: 5),
          Text('$tmp °C',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold
          )),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}