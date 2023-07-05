default: gen lint

gen:
    flutter pub get
    flutter_rust_bridge_codegen \
        -r native/src/api.rs \
        -d lib/gen/bridge_generated.dart \
        --dart-decl-output lib/gen/bridge_definitions.dart \
        -c macos/Runner/bridge_generated.h \
        -e ios/Runner \
        --wasm --verbose

l10n:
    flutter gen-l10n

lint:
    cd native && cargo fmt
    dart format .

clean:
    flutter clean
    cd native && cargo clean

serve *args='':
    flutter pub run flutter_rust_bridge:serve {{args}}

sync:
    cd flows && dart run example/sync.dart

# vim:expandtab:sw=4:ts=4

# https://docs.flutter.dev/development/platform-integration/desktop
# sudo apt-get install clang cmake ninja-build pkg-config libgtk-3-dev liblzma-dev libstdc++-12-dev
