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

## VsCode: Flutter App DevContainer Workflow
Host OS: Windows 10 running Docker on WSL2 (unable to use --network=host which could be viable on other Hosts)

The workflow is as follows:

1. Start an AVD on the Docker Host
2. Develop the Flutter App in the DevContainer in VsCode
3. 'flutter run' will deploy the .apk to the AVD running on the Docker Host
4. Hot reload is supported

### VsCode Extensions
Install the following VsCode extension(s):

* Remote - Containers (ms-vscode-remote.remote-containers)

### To work in the VsCode DevContainer
Run the Command: Remote-Containers - Open Folder in Container... and select the root of the repository. You can then build the app as follows as a sanity in the container:

```
cd src/howdi_welt
flutter clean
flutter pub get
flutter build apk --debug
```

Assuming you have a running AVD on your Docker Host, you should see something like this when you run 'flutter devices' from within the container:

```
flutter devices
1 connected device:

sdk gphone x86 • emulator-5554 • android-x86 • Android 11 (API 30) (emulator)
```

If not, ensure the 'adb server' is running on the Docker Host by executing this command on the Docker Host:

```
adb start-server
```

### Debug Workflow
To run the Flutter App and support hot reload - which will target the AVD running on your Docker Host, execute the following command in the container:

```
flutter run --host-vmservice-port 45680 -v
```

### Implementation
Four configurations:

1. There is a 'magic' hostname available in all Docker containers called 'host.docker.internal' which allows us to reach the Docker Host. 

2. The Dockerfile sets an ENV to ADB_SERVICE_SOCKER=tcp:host.docker.internal:5037. This globally configures the adb server/socket location to be used by tools that know about that variable (not all Android tooling appears to; but Flutter does)

3. 'flutter run --host-vmservice-port 45680' will start the app and configure the Dart VM Service to forward its port to 45680 on the Docker Host (this is the port we use for the Observatory)

4. devcontainer.json is configured to run 'socat tcp-listen:45680,reuseaddr,fork tcp:host.docker.internal:45680 &' in the container every time it starts; this will redirect any calls from 127.0.0.1:45680 (made in the context of the container - namely, to the Dart Observatory) to host.docker.internal:45680 (where the Dart VM Service port is forwarded to). This is what allows 'flutter run' to listen to the Dart Observatory running on the Docker Host AVD.

If there is more than one AVD running on the Docker Host, set the following variable in the container to direct Flutter to target your chosen device. ie:

```
export ANDROID_SERIAL=emulator-5554
```

# References
| Description | Link |
| ----------- | ---- |
| Network Host (use this so there's no need for port forwarding) - but only on Linux | https://docs.docker.com/network/host/ |
| Starting point for your own containers containing Java JDK, Flutter, Dart, Android SDKs | https://github.com/MobileDevOps/flutter-sdk-image | 
| Java/Gradle Interop Issues galore | https://github.com/gradle/gradle/issues/10248 |
| Create a tunnel from one port to another | https://unix.stackexchange.com/questions/10428/simple-way-to-create-a-tunnel-from-one-local-port-to-another |
| Remote Debugging (Android Emulator) | https://www.manongdao.com/q-1175182.html |
