## Adding String Resource

1. Add pairs to related json file under `asset/translation`.
2. Run the command below to generate locale keys.

```
sh scripts/lang.sh
```


## To use modules after updating it

1. Add related module to pubspec.yaml.
2. Run the command below.

```
dart run build_runner build  --delete-conflicting-outputs
```
