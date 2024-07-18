import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigService {
  Future<bool> getEmailMaskingSetting() async {
    final remoteConfig = FirebaseRemoteConfig.instance;
    await remoteConfig.fetchAndActivate();
    return remoteConfig.getBool('mask_email');
  }
}
