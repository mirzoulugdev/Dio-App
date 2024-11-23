import 'package:country_flags/country_flags.dart';
import 'package:dio_app/data/model/currency_model.dart';
import 'package:dio_app/data/services/api_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Work with Dio"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: ApiServices().getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasData) {
              final List<CurrencyModel> data =
                  snapshot.data as List<CurrencyModel>;

              return SafeArea(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CountryFlag.fromCountryCode(
                        data[index].code.substring(0, 2),
                        shape: const RoundedRectangle(
                          10,
                        ),
                      ),
                      title: Text(data[index].code),
                      subtitle: Text(data[index].title),
                      trailing: Text(
                        "${data[index].cbPrice} so'm",
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                ),
              );
            }
            return const Center(
              child: Text("Salom"),
            );
          },
        ),
      ),
    );
  }
}
