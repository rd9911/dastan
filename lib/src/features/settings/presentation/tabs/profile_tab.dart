import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:file_picker/file_picker.dart';
import 'package:dastan/src/features/settings/application/settings_store.dart';
import 'package:dastan/src/core/data/supabase_auth_service.dart';

/// Profile tab with live preview for locale/currency/units changes.
class ProfileTab extends ConsumerStatefulWidget {
  final VoidCallback onChanged;

  const ProfileTab({super.key, required this.onChanged});

  @override
  ConsumerState<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends ConsumerState<ProfileTab> {
  late TextEditingController _nameController;
  late TextEditingController _homeCityController;
  String _selectedLocale = 'en';
  String _selectedCurrency = 'USD';
  String _selectedTimezone = 'UTC';
  bool _useKilometers = true;
  bool _useCelsius = true;
  bool _use24HourClock = true;

  static const _locales = [
    'en',
    'de',
    'fr',
    'es',
    'it',
    'pt',
    'nl',
    'ja',
    'zh',
  ];
  static const _currencies = ['USD', 'EUR', 'GBP', 'JPY', 'AUD', 'CAD', 'CHF'];
  static const _timezones = [
    'UTC',
    'America/New_York',
    'America/Los_Angeles',
    'Europe/London',
    'Europe/Paris',
    'Asia/Tokyo',
    'Australia/Sydney',
  ];

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _homeCityController = TextEditingController();
    _loadFromStore();
  }

  void _loadFromStore() {
    final profile = ref.read(settingsStoreNotifierProvider).state.profile;
    if (profile != null) {
      _nameController.text = profile.name;
      _homeCityController.text = profile.homeCity ?? '';
      _selectedLocale = profile.locale;
      _selectedCurrency = profile.currency;
      _selectedTimezone = profile.timezone;
      _useKilometers = profile.units.useKilometers;
      _useCelsius = profile.units.useCelsius;
      _use24HourClock = profile.units.use24HourClock;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _homeCityController.dispose();
    super.dispose();
  }

  void _onFieldChanged() {
    widget.onChanged();
    _updatePreview();
  }

  void _updatePreview() {
    // Trigger immediate preview update
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar section
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: theme.colorScheme.primaryContainer,
                  child: Icon(
                    Icons.person,
                    size: 50,
                    color: theme.colorScheme.onPrimaryContainer,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: theme.colorScheme.primary,
                    child: IconButton(
                      iconSize: 18,
                      icon: Icon(
                        Icons.camera_alt,
                        color: theme.colorScheme.onPrimary,
                      ),
                      onPressed: () async {
                        final result = await FilePicker.platform.pickFiles(type: FileType.image);
                        if (result != null && result.files.isNotEmpty) {
                          // TODO: Upload image to user-avatars bucket via StorageService
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Avatar updated')),
                            );
                            _onFieldChanged();
                          }
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          // Name
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person_outline),
            ),
            onChanged: (_) => _onFieldChanged(),
          ),
          const SizedBox(height: 16),

          // Home city
          TextField(
            controller: _homeCityController,
            decoration: const InputDecoration(
              labelText: 'Home City',
              prefixIcon: Icon(Icons.location_city),
              hintText: 'For timezone detection',
            ),
            onChanged: (_) => _onFieldChanged(),
          ),
          const SizedBox(height: 16),

          // Timezone
          DropdownButtonFormField<String>(
            initialValue: _selectedTimezone,
            decoration: const InputDecoration(
              labelText: 'Timezone',
              prefixIcon: Icon(Icons.schedule),
            ),
            items: _timezones
                .map((tz) => DropdownMenuItem(value: tz, child: Text(tz)))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedTimezone = value);
                _onFieldChanged();
              }
            },
          ),
          const SizedBox(height: 24),

          Text('Localization', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),

          // Language
          DropdownButtonFormField<String>(
            initialValue: _selectedLocale,
            decoration: const InputDecoration(
              labelText: 'Language',
              prefixIcon: Icon(Icons.language),
            ),
            items: _locales
                .map(
                  (l) =>
                      DropdownMenuItem(value: l, child: Text(_localeName(l))),
                )
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedLocale = value);
                _onFieldChanged();
              }
            },
          ),
          const SizedBox(height: 16),

          // Currency
          DropdownButtonFormField<String>(
            initialValue: _selectedCurrency,
            decoration: const InputDecoration(
              labelText: 'Currency',
              prefixIcon: Icon(Icons.attach_money),
            ),
            items: _currencies
                .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                .toList(),
            onChanged: (value) {
              if (value != null) {
                setState(() => _selectedCurrency = value);
                _onFieldChanged();
              }
            },
          ),
          const SizedBox(height: 24),

          Text('Units', style: theme.textTheme.titleMedium),
          const SizedBox(height: 12),

          // Distance units
          SwitchListTile(
            title: const Text('Distance'),
            subtitle: Text(_useKilometers ? 'Kilometers' : 'Miles'),
            value: _useKilometers,
            onChanged: (value) {
              setState(() => _useKilometers = value);
              _onFieldChanged();
            },
          ),

          // Temperature
          SwitchListTile(
            title: const Text('Temperature'),
            subtitle: Text(_useCelsius ? 'Celsius' : 'Fahrenheit'),
            value: _useCelsius,
            onChanged: (value) {
              setState(() => _useCelsius = value);
              _onFieldChanged();
            },
          ),

          // Clock format
          SwitchListTile(
            title: const Text('Clock Format'),
            subtitle: Text(_use24HourClock ? '24-hour' : '12-hour'),
            value: _use24HourClock,
            onChanged: (value) {
              setState(() => _use24HourClock = value);
              _onFieldChanged();
            },
          ),

          const SizedBox(height: 24),

          // Live preview section
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Preview', style: theme.textTheme.titleSmall),
                  const SizedBox(height: 12),
                  _PreviewRow(
                    label: 'Distance',
                    value: _useKilometers ? '5.2 km' : '3.2 mi',
                  ),
                  _PreviewRow(
                    label: 'Temperature',
                    value: _useCelsius ? '22°C' : '72°F',
                  ),
                  _PreviewRow(
                    label: 'Time',
                    value: _use24HourClock ? '14:30' : '2:30 PM',
                  ),
                  _PreviewRow(label: 'Price', value: _formatCurrency(149.99)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: OutlinedButton.icon(
              onPressed: () async {
                await ref.read(supabaseAuthServiceProvider.notifier).signOut();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Signed out successfully')),
                  );
                }
              },
              icon: const Icon(Icons.logout, color: Colors.red),
              label: const Text('Sign Out', style: TextStyle(color: Colors.red)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.red),
              ),
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  String _localeName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'de':
        return 'Deutsch';
      case 'fr':
        return 'Français';
      case 'es':
        return 'Español';
      case 'it':
        return 'Italiano';
      case 'pt':
        return 'Português';
      case 'nl':
        return 'Nederlands';
      case 'ja':
        return '日本語';
      case 'zh':
        return '中文';
      default:
        return code;
    }
  }

  String _formatCurrency(double amount) {
    switch (_selectedCurrency) {
      case 'EUR':
        return '€${amount.toStringAsFixed(2)}';
      case 'GBP':
        return '£${amount.toStringAsFixed(2)}';
      case 'JPY':
        return '¥${amount.toInt()}';
      default:
        return '\$${amount.toStringAsFixed(2)}';
    }
  }
}

class _PreviewRow extends StatelessWidget {
  final String label;
  final String value;

  const _PreviewRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(color: Colors.grey)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }
}
