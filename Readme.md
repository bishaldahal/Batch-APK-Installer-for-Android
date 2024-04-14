# APK Installer Script

A Windows batch script for installing Android APK files on a connected device using `adb` and `aapt`.

## Description

This script automates the process of installing APKs on an Android device. It's useful for developers who need to install multiple APKs frequently and for those who require frequent backups restoration. The script uses `adb` and `aapt` from the Android SDK to install APKs that aren't already on the device.

## Prerequisites

- Android Debug Bridge (adb)
- Android Asset Packaging Tool (aapt)

Download both from the [Android developer website](https://developer.android.com/studio).

## Usage

1. Connect your Android device to your computer.
2. Enable USB debugging on your device.
3. Copy the `install.bat` script to the directory containing the APK files you want to install.
4. Double click the `install.bat` file.
5. Follow the instruction

OR

4. Open a command prompt and navigate to the directory containing the APK files and the `install.bat` script.
5. Run the script with the following command:

```sh
install.bat
#When prompted, enter the full path to the directory that contains aapt.exe.
```


# Contributing

We welcome contributions to this project! Here's how you can help:

1. Fork this repository.
2. Create a new branch in your forked repository.
3. Make your changes in the new branch.
4. Submit a pull request from the new branch in your forked repository to the main branch in this repository.

We'll review your pull request and merge it if everything looks good.


## License

This project is licensed under the MIT License.
