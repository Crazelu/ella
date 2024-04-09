# Ella

Ella is a Flutter project bootstrapper that generates a starter Flutter project with all of my opinions.

## Features
Ella creates a starter Flutter project with all of these out of the box:

- [x] Localization
- [x] HTTP client with interceptors ([Dio](https://pub.dev/packages/dio))
- [x] Local storage
- [x] Navigation
- [x] Dialogs
- [x] Service Location with [get_it](https://pub.dev/packages/get_it)
- [x] Feature based architecture
- [x] Testing
- [x] Flavor setup (additional setup is required in the platform targets)

### Web

Ella can also generate a starter Flutter web project with all of the features above and some more including:

- [x] Responsive builder
- [x] A footer (to cement my presence on my web apps 😉)

Ella also updates the title and description both in the `manifest.json` file as well as the `index.html` file of the web project.
In the future, Ella should be able to take an image and create different sizes for the favicon.

## How To Use
Clone the project
```sh
git clone 
```

Fire Ella up!

```sh
dart run bin/ella.dart -o path/to/output/directory -n projectName --platforms android,ios,web
```

## Future Goals
In the future, one should be able to pass their own templates to Ella to automate repeated starter setup tasks.