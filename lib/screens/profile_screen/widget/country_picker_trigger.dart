import 'package:flutter/material.dart';
import 'package:millionaire_trivia/models/country_model.dart';
import 'package:millionaire_trivia/screens/profile_screen/widget/country_picker_dialog.dart';
import 'package:millionaire_trivia/services/country_service.dart';

class CountryPickerTrigger extends StatefulWidget {
  final TextEditingController controller;

  const CountryPickerTrigger({super.key, required this.controller});

  @override
  State<CountryPickerTrigger> createState() => _CountryPickerTriggerState();
}

class _CountryPickerTriggerState extends State<CountryPickerTrigger> {
  List<Country> countries = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadCountries();
    });
  }

  Future<void> _loadCountries() async {
    try {
      final loaded = await loadCountries(context);
      if (mounted) {
        setState(() {
          countries = loaded;
          isLoading = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load countries: $e'),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  void _openCountryPicker() {
    if (isLoading) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Loading countries, please wait...'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }
    if (countries.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No countries available'),
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    showCountryPickerDialog(
      context: context,
      allCountries: countries,
      onSelected: (Country selected) {
        widget.controller.text = '${selected.emoji} ${selected.name}';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openCountryPicker,
      child: AbsorbPointer(
        child: TextField(
          controller: widget.controller,
          readOnly: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: isLoading ? 'Loading countries...' : 'Country',
            hintStyle: const TextStyle(color: Colors.white70),
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.cyan),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}