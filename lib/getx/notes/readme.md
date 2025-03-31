### how to add it to the Main.dart file ?

```
class MyApp extends StatelessWidget {
const MyApp({super.key});
@override
Widget build(BuildContext context) {
  return GetMaterialApp( -->  Instead of returning material app return it.
    title: 'Flutter Demo',
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      useMaterial3: true,
    ),
    routes: {"/home": (context) => const HomePage()},
    initialRoute: "/home",
  );
}
}
```

### To connect a diaog.

`Get.dialog(AddAssetDialog())`;

### Dependency Injection.(After crearting the service.)

```
Future<void> registerService() async {
Get.put(HTTPService());
  }
```
