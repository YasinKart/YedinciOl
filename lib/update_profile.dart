import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatelessWidget {
  final Map<String, String> profileData;
  final Function(Map<String, String>) onUpdate;

  UpdateProfileScreen({Key? key, required this.profileData, required this.onUpdate}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController surnameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController footController = TextEditingController();
  final TextEditingController contactController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController teamController = TextEditingController();

  @override
  void initState() {
    nameController.text = profileData['name'] ?? '';
    surnameController.text = profileData['surname'] ?? '';
    ageController.text = profileData['age'] ?? '';
    heightController.text = profileData['height'] ?? '';
    weightController.text = profileData['weight'] ?? '';
    positionController.text = profileData['position'] ?? '';
    footController.text = profileData['foot'] ?? '';
    contactController.text = profileData['contact'] ?? '';
    cityController.text = profileData['city'] ?? '';
    teamController.text = profileData['team'] ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios)
        ),
        title: Text('Profil Düzenle', style: Theme.of(context).textTheme.headline4),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            children: [
              const SizedBox(height: 50),
              Form(
                child: Column(
                  children: [
                    _buildTextFormField(nameController, 'İsim', 'İsminizi Giriniz'),
                    const SizedBox(height: 20),
                    _buildTextFormField(surnameController, 'Soyisim', 'Soyisminizi Giriniz'),
                    const SizedBox(height: 20),
                    _buildTextFormField(ageController, 'Yaş', 'Yaşınızı Giriniz', isNumeric: true),
                    const SizedBox(height: 20),
                    _buildTextFormField(heightController, 'Boy', 'Boyunuzu Giriniz', isNumeric: true),
                    const SizedBox(height: 20),
                    _buildTextFormField(weightController, 'Kilo', 'Kilonuzu Giriniz', isNumeric: true),
                    const SizedBox(height: 20),
                    _buildTextFormField(positionController, 'Pozisyon', 'Pozisyonunuzu Giriniz'),
                    const SizedBox(height: 20),
                    _buildTextFormField(footController, 'Güçlü Ayak', 'Güçlü Ayağınızı Giriniz'),
                    const SizedBox(height: 20),
                    _buildTextFormField(contactController, 'İletişim', 'İletişim Bilgilerinizi Giriniz'),
                    const SizedBox(height: 20),
                    _buildTextFormField(cityController, 'Şehir', 'Şehrinizi Giriniz'),
                    const SizedBox(height: 20),
                    _buildTextFormField(teamController, 'Tuttuğu Takım', 'Tuttuğunuz Takımı Giriniz'),
                    const SizedBox(height: 20),
                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => updateProfile(context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text('Profili Düzenle', style: TextStyle(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFormField(TextEditingController controller, String label, String errorText, {bool isNumeric = false}) {
    return TextFormField(
      controller: controller,
      keyboardType: isNumeric ? TextInputType.number : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(label),
      ),
    );
  }

  void updateProfile(BuildContext context) {
    final updatedProfileData = {
      'name': nameController.text,
      'surname': surnameController.text,
      'age': ageController.text,
      'height': heightController.text,
      'weight': weightController.text,
      'position': positionController.text,
      'foot': footController.text,
      'contact': contactController.text,
      'city': cityController.text,
      'team': teamController.text,
    };

    onUpdate(updatedProfileData);
    Navigator.pop(context);
  }
}