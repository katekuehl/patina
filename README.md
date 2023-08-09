# flutter_rust_bridge_template

This repository serves as a template for Flutter projects calling into native Rust
libraries via `flutter_rust_bridge`.

## Getting Started

To begin, ensure that you have a working installation of the following items:
- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Rust language](https://rustup.rs/)
- Appropriate [Rust targets](https://rust-lang.github.io/rustup/cross-compilation.html) for cross-compiling to your device
- For Android targets:
    - Install [cargo-ndk](https://github.com/bbqsrc/cargo-ndk#installing)
    - Install Android NDK 22, then put its path in one of the `gradle.properties`, e.g.:

```
echo "ANDROID_NDK=.." >> ~/.gradle/gradle.properties
```

- [Web dependencies](http://cjycode.com/flutter_rust_bridge/template/setup_web.html) for the Web

Then go ahead and run `flutter run`! When you're ready, refer to our documentation
[here](https://fzyzcjy.github.io/flutter_rust_bridge/index.html)
to learn how to write and use binding code.

Once you have edited `api.rs` to incorporate your own Rust code, the bridge files `bridge_definitions.dart` and `bridge_generated.dart` are generated using the following command:

### Windows
```
flutter_rust_bridge_codegen --rust-input native\src\api.rs --dart-output .\lib\bridge_generated.dart --dart-decl-output .\lib\bridge_definitions.dart
```

### Linux/MacOS/any other Unix
```
flutter_rust_bridge_codegen --rust-input native/src/api.rs --dart-output ./lib/bridge_generated.dart --dart-decl-output ./lib/bridge_definitions.dart
```

## Scaffolding in existing projects

If you would like to generate boilerplate for using `flutter_rust_bridge` in your existing projects,
check out the [`flutter_rust_bridge` brick](https://brickhub.dev/bricks/flutter_rust_bridge/)
for more details.


Of course! Here's the content you provided, converted to Markdown format suitable for a GitHub README.md.


# Initial Setup

1. Open the terminal and execute the following commands:

```bash
sudo apt update
sudo apt upgrade
git clone https://github.com/jlewallen/patina
cd patina
echo "abc" > .env
git clone https://github.com/jlewallen/rustfk
touch .env
nano .env
```

2. Inside the `nano` editor:
    - Write: `#OK`
    - Press `Ctrl + O` to save.
    - Press `Enter`.
    - Press `Ctrl + X` to exit.

## Android Studio Setup

1. Download and install [Android Studio](https://developer.android.com/studio).
2. Launch Android Studio and navigate to `Tools > SDK Manager > SDK Tools`.
3. Enable `Show Package Details`.
4. Select version `25` of the NDK.
5. Choose the latest "Android SDK Command-line Tools".
6. Click on “OK” and wait for the download to complete.

7. Add Android NDK and Flutter path to your `.bashrc`:

```bash
nano ~/.bashrc
```

Append the following lines (replace [PATH/TO/NDK] and [PATH/TO/FLUTTER] with the appropriate paths):

```bash
export ANDROID_NDK="/home/[PATH/TO/NDK]/Android/Sdk/ndk/22.1.7171670"
export PATH="$PATH:/home/[PATH/TO/FLUTTER]flutter/bin"
```

Then save and exit (`Ctrl + O`, `Enter`, `Ctrl + X`).

## Libraries and Tools Installation

Install the required libraries:

```bash
sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev libsecret-1-dev build-essential libjsoncpp-dev libsecret-1-0
```

### Flutter

Follow the instructions to [install Flutter manually](https://docs.flutter.dev/get-started/install/linux#install-flutter-manually).

### Rust

1. Install Rust:

```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

2. Add targets for Rust:

```bash
rustup target add arm-linux-androideabi
```

3. After restarting the terminal:

```bash
cargo install cargo-ndk
```

4. Add additional Rust targets:

```bash
rustup target add \
    aarch64-linux-android \
    armv7-linux-androideabi \
    x86_64-linux-android \
    i686-linux-android
```

## Running the Project

1. Check for any issues with Flutter:

```bash
flutter doctor
```

2. Run the project:

```bash
flutter run
```

## Fixes to Known Issues

- [Issue: GLIBC_2.33 not found - while building Flutter for Linux](https://stackoverflow.com/questions/74156104/glibc-2-33-not-found-while-building-flutter-for-linux)
