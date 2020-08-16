FROM openjdk:8u252-jdk-buster

LABEL maintainer="greyhamwoohoo"

#
# ADB / FLUTTER SPECIFIC STUFF
#
# flutter run ... will need to find devices to target - use the ADB server on our Docker Host. 
ENV ADB_SERVER_SOCKET=tcp:host.docker.internal:5037

#
# Credit to https://github.com/MobileDevOps for a lot of this
#
ENV ANDROID_HOME "/opt/android-sdk"
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

ENV FLUTTER_VERSION="1.17.1"
ENV FLUTTER_HOME "/opt/.flutter-sdk"
ENV PATH $PATH:$FLUTTER_HOME/bin

#
# Download the Android 'sdkmanager' directory from here - this lets us install the SDK of our choosing
# https://developer.android.com/studio
#
RUN mkdir /opt/androidsdkmanager && \
    cd /opt/androidsdkmanager && \
    curl --location --fail --remote-time -O https://dl.google.com/android/repository/commandlinetools-linux-6514223_latest.zip && \
    unzip commandlinetools-linux-6514223_latest.zip && \
    rm commandlinetools-linux-6514223_latest.zip

RUN cd /opt/androidsdkmanager/tools/bin && \
    ./sdkmanager --list --sdk_root=/opt/android-sdk && \
    yes | ./sdkmanager --licenses --sdk_root=/opt/android-sdk && \
    ./sdkmanager --install "platforms;android-29" "build-tools;28.0.3" "platform-tools" --sdk_root=/opt/android-sdk

#
# Install Flutter
#
RUN mkdir $FLUTTER_HOME \
    && cd $FLUTTER_HOME \
    && curl --fail --remote-time --location -O https://storage.googleapis.com/flutter_infra/releases/stable/linux/flutter_linux_${FLUTTER_VERSION}-stable.tar.xz \
    && tar xf flutter_linux_${FLUTTER_VERSION}-stable.tar.xz --strip-components=1 \
    && rm flutter_linux_${FLUTTER_VERSION}-stable.tar.xz

#
# Install socat
#
RUN apt-get update && apt-get install socat -y
