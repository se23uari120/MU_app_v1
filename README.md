# Mahindra University Portal App (MU Application)

A high-speed, lightweight Flutter mobile application that serves as the official portal launcher for Mahindra University students and parents.

This project was intentionally redesigned and simplified to strip away heavy, unnecessary legacy backend architectures (like Firebase) in favor of a clean, direct, in-app web experience.

## ✨ Features
* **Modern UI**: A highly polished, responsive Landing Screen featuring a split-gradient design and dynamic color scaling to match the official university branding.
* **Direct Integration**: Utilizes `webview_flutter` to securely load the official [Mahindra University website](https://www.mahindrauniversity.edu.in/) and the internal Student/Parent ERP portals directly inside the app, without forcing the user out to an external browser.
* **Lightweight & Fast**: By removing state management bloat and heavy authentication SDKs, the app's boot time and memory footprint have been drastically reduced.
* **Production Ready**: Fully configured for Google Play Store deployment, including an internal Release Keystore setup and `.aab` compilation.

## 🛠 Tech Stack
* **Framework:** [Flutter](https://flutter.dev/)
* **Language:** Dart
* **Core Packages:** `webview_flutter`

## 🚀 Getting Started

### Prerequisites
* Flutter SDK (>= 3.0.0)
* Android Studio (for emulator and compilation)
* Java Development Kit (JDK) 17

### Running Locally
1. Clone this repository:
   ```bash
   git clone https://github.com/se23uari120/MU_app_v1.git
   ```
2. Navigate into the project directory:
   ```bash
   cd MU_app_v1
   ```
3. Fetch the dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app on an emulator or connected device:
   ```bash
   flutter run
   ```

## 📦 Building for Production
To generate a standalone APK that can be installed directly on Android phones:
```bash
flutter build apk --release
```
*(The generated file will be located at `build/app/outputs/flutter-apk/app-release.apk`)*

To generate the official Android App Bundle for the Google Play Store:
```bash
flutter build appbundle
```

---
**Note:** For security reasons, the `upload-keystore.jks` and `key.properties` files required to digitally sign the production `.aab` file have been deliberately excluded from this repository via `.gitignore`. You must supply your own keystore files to push an official update to the Play Store.
