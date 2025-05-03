# Connectly

Connectly is a Flutter mobile application that allows users to perform the following actions with a phone number:

1. 📞 Call the number
2. 💬 Send an SMS
3. 🟢 Open a WhatsApp chat with the number
4. 🔵 Open a Telegram chat with the number

## Features
- Real-time phone number validation (minimum 9 digits, digits only).
- Visual feedback for invalid input.
- Uses `flutter_bloc` for state management.
- External actions handled via `url_launcher`.
- Toast messages for success/failure feedback.
- Modern typography with `google_fonts`.

## Setup Instructions

1. **Install Dependencies**:
   ```bash
   flutter pub get
   ```

2. **Generate App Icon**:
   Ensure your app icon is located at `assets/icons/app_icon.png`, then run:
   ```bash
   flutter pub run flutter_launcher_icons:main
   ```

3. **Run the App**:
   ```bash
   flutter run
   ```

## Folder Structure
```
lib/
├── main.dart
├── cubit/
│   ├── phone_cubit.dart
│   └── phone_state.dart
├── screens/
│   └── home_screen.dart
├── widgets/
│   ├── phone_input_field.dart
│   └── action_buttons.dart
├── services/
    ├── call_launcher.dart
    ├── sms_launcher.dart
    ├── whatsapp_launcher.dart
    └── telegram_launcher.dart
```

## Dependencies
- `flutter_bloc`
- `url_launcher`
- `fluttertoast`
- `google_fonts`
- `flutter_launcher_icons`

## License
This project is licensed under the MIT License.
