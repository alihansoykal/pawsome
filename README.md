# Pawsome
Product/Feature based architecture with independent modules.

## Built with
### Routing 
  auto_route
### State 
  flutter_bloc
### Caching
  hive
### Dependency injection
  get_it
### Network 
  vexana
### Localization
  easy_localization
### Error Handling
  easy_logger
  logger



## Just FYI
To run the app "pub get" is enough.
## Adding String Resource

1. Add pairs to related json file under `asset/translation`.
2. Run the command below to generate locale keys.

```
sh scripts/lang.sh
```


## To use modules after updating them

1. Add related module to pubspec.yaml.
2. Run the command below.

```
dart run build_runner build  --delete-conflicting-outputs
```
