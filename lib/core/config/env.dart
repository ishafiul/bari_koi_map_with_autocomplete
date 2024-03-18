import 'package:envied/envied.dart';

part 'env.g.dart';

/// env variables of this project
@Envied(path: '.env')
class EnvProd {
  @EnviedField(varName: 'BARIKOI_HOST_API')
  static const String barikoiHost = _EnvProd.barikoiHost;
  @EnviedField(varName: 'BARIKOI_API_KEY')
  static const String barikoiApiKey = _EnvProd.barikoiApiKey;
}
