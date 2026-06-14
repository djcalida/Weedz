# App Signing Setup

This document explains how the Wedzz mobile app is signed and how to set it up for updates.

## Overview

The app is now signed with a consistent keystore to allow seamless updates. When you install a new version of the app, Android will recognize it as an update (not a new app) and won't show the "conflict with existing package" error.

## Package Details

- **Package Name**: `com.wedzz.mobile` (changed from `com.example.wedzz_mobile`)
- **Version**: Automatically read from `pubspec.yaml`
- **Keystore**: `android/app/upload-keystore.jks`

## Keystore Credentials

- **Store Password**: `wedzz2024`
- **Key Alias**: `upload`
- **Key Password**: `wedzz2024`

**⚠️ Important**: Keep these credentials secure! The keystore file is already in `.gitignore` and won't be committed to the repository.

## GitHub Actions Setup

To build signed APKs on GitHub Actions, you need to add the keystore as a secret:

1. **Encode the keystore to base64** (already done):
   - The file `keystore_base64.txt` contains the base64-encoded keystore
   
2. **Add it as a GitHub Secret**:
   - Go to your repository on GitHub
   - Navigate to `Settings` → `Secrets and variables` → `Actions`
   - Click `New repository secret`
   - Name: `KEYSTORE_BASE64`
   - Value: Copy and paste the entire content from `keystore_base64.txt`
   - Click `Add secret`

3. **Build APKs**:
   - Push to the `mobile-app-flutter` branch
   - GitHub Actions will automatically build and sign the APK
   - Download the `wedzz-mobile-release` artifact from the Actions tab

## Local Building

If you want to build locally:

```powershell
cd d:\JiM\Project\Wedzz_official\mobile_app\android
flutter build apk --release
```

The APK will be at: `build/app/outputs/flutter-apk/app-release.apk`

## Installing Updates on Your Phone

1. **First Installation**:
   - Download the APK
   - Enable "Install from Unknown Sources" in your phone settings
   - Install the APK

2. **Subsequent Updates**:
   - Download the new APK (make sure the version code has been incremented)
   - Tap the APK file
   - Android will show "Update" instead of "Install"
   - Tap "Update" - your data and settings will be preserved!

## Version Management

When creating a new version:

1. Update the version in `pubspec.yaml`:
   ```yaml
   version: 1.0.0+2  # The number after + is the version code
   ```
   
2. Increment the version code (the number after `+`) for each new build:
   - `1.0.0+1` → `1.0.0+2` → `1.0.0+3` etc.
   - Or update the version number: `1.0.0+1` → `1.0.1+1` → `1.1.0+1` → `2.0.0+1`

## Troubleshooting

### "Conflict with existing package" error
This means:
- The keystore used to sign the new APK is different from the old one
- **Solution**: Uninstall the old app first, then install the new one. After this, future updates will work properly.

### "App not installed" error
- Check that the version code is higher than the current installed version
- Make sure the keystore hasn't changed

### Building fails with "Keystore not found"
- **Local build**: Make sure `android/app/upload-keystore.jks` exists
- **GitHub Actions**: Make sure the `KEYSTORE_BASE64` secret is properly set

## Security Notes

- The keystore file (`upload-keystore.jks`) is ignored by Git
- Keep backups of the keystore file in a secure location
- If you lose the keystore, users will need to uninstall and reinstall the app (they'll lose their data)
- For production apps, consider using Google Play App Signing for additional security
