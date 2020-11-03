import 'dart:core';
import 'package:at_client_mobile/at_client_mobile.dart';
import 'package:at_utils/at_logger.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:at_commons/at_commons.dart';
import '../utils/at_conf.dart' as conf;

class ServerDemoService {
  static final ServerDemoService _singleton = ServerDemoService._internal();

  ServerDemoService._internal();

  final AtSignLogger _logger = AtSignLogger('ServerDemoService');

  factory ServerDemoService.getInstance() {
    return _singleton;
  }

  AtClientService atClientServiceInstance;
  AtClientImpl atClientInstance;

  initClient(String atsign, {String secret, String privateKey}) async {
    try {
      atClientServiceInstance = AtClientService();
      atClientInstance = await AtClientImpl.getClient(atsign);
    } on Exception catch (e, trace) {
      _logger.severe(e.toString());
      _logger.severe(trace);
    }
  }

  Future<bool> onboard({String atsign}) async {
    atClientServiceInstance = AtClientService();
    final appDocumentDirectory =
    await path_provider.getApplicationDocumentsDirectory();
    String path = appDocumentDirectory.path;
    var atClientPreference = AtClientPreference()
      ..isLocalStoreRequired = true
      ..commitLogPath = path
      ..syncStrategy = SyncStrategy.IMMEDIATE
      ..rootDomain = 'test.do-sf2.atsign.zone'
      ..hiveStoragePath = path;
    var result = await atClientServiceInstance.onboard(
        atClientPreference: atClientPreference,
        atsign: atsign,
        namespace: conf.namespace);
    atClientInstance = atClientServiceInstance.atClient;
    return result;
  }

  ///Returns `false` if fails in authenticating [atsign] with [cramSecret]/[privateKey].
  Future<bool> authenticate(String atsign,
      {String cramSecret, String privateKey}) async {
    var result = await atClientServiceInstance.authenticate(atsign,
        cramSecret: cramSecret);
    atClientInstance = atClientServiceInstance.atClient;
    return result;
  }


  ///Returns `true` on successfully authenticating [atsign] with [privateKey].
  Future<bool> authenticateWithPrivateKey(String privateKey) async {
    return await atClientServiceInstance.pkamAuth(privateKey);
  }

  Future<String> getAtSign() async {
    return await atClientServiceInstance.getAtSign();
  }

  Future<String> get(AtKey atKey) async {
    var result = await atClientInstance.get(atKey);
    return result.value;
  }

  Future<bool> put(AtKey atKey, String value) async {
    return await this.atClientInstance.put(atKey, value);
  }

  Future<bool> delete(AtKey atKey) async {
    return await this.atClientInstance.delete(atKey);
  }

  Future<List<String>> getKeys({String sharedBy}) async {
    return await this
        .atClientInstance
        .getKeys(regex: conf.namespace, sharedBy: sharedBy);
  }

  String _getKeyName(String query) {
    String match = RegExp('(\w*\.)*hello_world@').stringMatch(query);
    match = match.replaceFirst(RegExp('.*:'), '');
    String keyName = match.split('.hello_world@')[0];
    return keyName;
  }

  _parseToAtKey(String key, {String sharedBy, String sharedWith}) {
    return AtKey()
      ..sharedBy = sharedBy
      ..sharedWith = sharedWith
      ..key = key;
  }

}

/// A class containing parameters to be passed for atClient
class AtObject {
  ///key on which CRUD operations are performed.
  /// ```
  /// Example: phone.me, firstname.me
  /// ```
  String key;

  /// value for a key to update
  String value;

  ///An atsign for which key will be assigned
  ///```
  ///Example :
  ///   update:@bob:firstname.me@alice
  ///   sharedwith = @bob
  ///```
  String sharedWith;

  ///An atsign that shares/assigns data for others
  ///```
  ///Example:
  ///   update:@bob:firstname.me@alice
  ///   sharedBy = @alice
  /// ```
  String sharedBy;

  ///set `true` if assigned data is for public.
  ///default it sets to false
  ///```
  ///Example:
  ///   update:public:firstname.me@alice
  ///   isPublic = true
  /// ```
  bool isPublic = false;

  ///regex for filtering keys
  String regex;
}