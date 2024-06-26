# Ella <img src="https://raw.githubusercontent.com/Crazelu/ella/main/assets/logo.png" align="center" height="56" width="56" alt="Ella's logo">

Ella is a Flutter project bootstrapper that generates an opinionated starter Flutter project for Android, iOS and Web in 30 seconds.

## Features
Ella creates a starter Flutter project with all of these out of the box:

- [x] Localization
- [x] Logging
- [x] HTTP client with interceptors ([Dio](https://pub.dev/packages/dio))
- [x] Local storage
- [x] Navigation
- [x] Dialogs with [flutter_dialog_manager](https://pub.dev/packages/flutter_dialog_manager)
- [x] Service Location with [get_it](https://pub.dev/packages/get_it)
- [x] Feature based architecture
- [x] Testing with [mockito](https://pub.dev/packages/mockito)
- [x] Flavor setup (additional setup is required in the platform targets)
- [x] Optional FVM configuration
- [x] Vscode launch configuration with support for different flavor entry points

### Web

Ella can also generate a starter Flutter web project with all of the features above and some more including:

- [x] Responsive builder
- [x] A footer (to cement my presence on my web apps 😉)

Ella also updates the title and description both in the `manifest.json` file as well as the `index.html` file of the web project.
In the future, Ella should be able to take an image and create different sizes for the favicon.

## How To Use
Clone the project
```sh
git clone git@github.com:Crazelu/ella.git
```

Fire Ella up!

```sh
dart run bin/ella.dart -o path/to/output/directory -n projectName --platforms android,ios,web
```

## Future Goals
In the future, one should be able to pass their own templates to Ella to automate repeated starter setup tasks.