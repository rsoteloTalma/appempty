import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:apptalma_empty/core/modules/general/panel/data/models/request/airport_info_request_model.dart';

class PanelPage extends StatefulWidget {
  const PanelPage({super.key});

  @override
  State<PanelPage> createState() => _PanelMainState();
}

class _PanelMainState extends State<PanelPage> {
  late Future<AirportInfo> _infoStation;

  bool _initialized = false;

  List<String> formatTitle(String text) {
    if (text.contains('-')) {
      return text.split('-');
    } else {
      return [text];
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_initialized) {
      _infoStation = Future.value(
        AirportInfo(
          airportId: 12,
          code: "BOG",
          name: "ElDorado",
          airportMessage: "Message",
          airportImage:
              "https://www.talma.com.co/ckfinder/talma_col_files/images/_AFS3184.jpg",
        ),
      );
      _initialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          FutureBuilder<AirportInfo>(
            future: _infoStation,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text("Error: ${snapshot.error}"));
              } else if (!snapshot.hasData) {
                return const Center(child: Text("No hay datos disponibles"));
              }

              AirportInfo airportInfo = snapshot.data!;

              return Column(
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: double.infinity,
                        child: airportInfo.airportImage.startsWith('http')
                            ? Image.network(
                                airportInfo.airportImage,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: Colors.black12,
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.broken_image,
                                      color: Colors.white70, size: 40),
                                ),
                              )
                            : Image.asset(
                                airportInfo.airportImage,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => Container(
                                  color: Colors.black12,
                                  alignment: Alignment.center,
                                  child: const Icon(Icons.broken_image,
                                      color: Colors.white70, size: 40),
                                ),
                              ),
                      ),
                      Positioned(
                        bottom: -20,
                        left: 15,
                        right: 15,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 8, sigmaY: 1),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 10),
                              decoration: BoxDecoration(
                                color:
                                    Colors.black.withAlpha((255 * 0.4).toInt()),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    airportInfo.airportMessage,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      const Icon(Icons.place,
                                          color: Colors.white, size: 15),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Text(
                                          "${airportInfo.name}, ${airportInfo.code}",
                                          style: const TextStyle(
                                              color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/logo_talma_2.png',
                    fit: BoxFit.contain,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push('/flight-info');
                    },
                    child: Text("Next"),
                  )
                ],
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
