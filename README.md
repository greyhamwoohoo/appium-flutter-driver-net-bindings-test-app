# appium-flutter-driver-net-bindings-test-app
Test App for the Appium Flutter Driver .Net Bindings (https://github.com/greyhamwoohoo/appium-flutter-driver-net-bindings)

## To build the Android .apk for the appium-flutter-driver-net-bindings .SystemTests using Docker
First, we need to build the Docker container that will let us build the .apk:

```
docker build -t appium-flutter-driver-net-bindings-test-app:local ./infra/builder
```

To build the .apk file and drop it on the host, in PowerShell:

```
docker run -v ${pwd}/src/howdi_welt:/app --workdir=/app --name bob appium-flutter-driver-net-bindings-test-app:local bash -c "cd /app; flutter pub get; flutter clean; flutter build apk --debug"
```

Depending on the alignment of the stars, direction of the wind and phase of the moon, the output will be dropped at 'src/howdi_welt/build/app/outputs/apk/debug/app-debug.apk'. 

That's the .apk file to use with the GreyhamWooHoo.Flutter.SystemTests from https://github.com/greyhamwoohoo/appium-flutter-driver-net-bindings

# References
| Description | Link |
| ----------- | ---- |
| Starting point for your own containers containing Java JDK, Flutter, Dart, Android SDKs | https://github.com/MobileDevOps/flutter-sdk-image | 
| Java/Gradle Interop Issues galore | https://github.com/gradle/gradle/issues/10248 |
