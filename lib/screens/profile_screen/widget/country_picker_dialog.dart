import 'package:flutter/material.dart';
import 'package:millionaire_trivia/models/country_model.dart';

void showCountryPickerDialog({
  required BuildContext context,
  required List<Country> allCountries,
  required Function(Country) onSelected,
}) {
  final TextEditingController searchController = TextEditingController();
  List<Country> filtered = List.from(allCountries);

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            backgroundColor: Colors.deepPurple[800],
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 400,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'Select your country',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: searchController,
                    style: const TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search country...',
                      hintStyle: const TextStyle(color: Colors.white70),
                      prefixIcon: const Icon(Icons.search, color: Colors.white70),
                      filled: true,
                      fillColor: Colors.deepPurple[700],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        filtered = allCountries
                            .where((c) => c.name.toLowerCase().contains(value.toLowerCase()))
                            .toList();
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: filtered.isEmpty
                        ? const Center(
                            child: Text(
                              'No results found',
                              style: TextStyle(color: Colors.white70),
                            ),
                          )
                        : ListView.builder(
                            itemCount: filtered.length,
                            itemBuilder: (_, index) {
                              final country = filtered[index];
                              return ListTile(
                                leading: country.image.isNotEmpty
                                    ? Image.network(
                                        country.image,
                                        width: 30,
                                        height: 20,
                                        errorBuilder: (_, __, ___) => Text(
                                          country.emoji,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      )
                                    : Text(
                                        country.emoji,
                                        style: const TextStyle(fontSize: 18),
                                      ),
                                title: Text(
                                  country.name,
                                  style: const TextStyle(color: Colors.white),
                                ),
                                onTap: () {
                                  onSelected(country);
                                  Navigator.pop(context);
                                },
                              );
                            },
                          ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
