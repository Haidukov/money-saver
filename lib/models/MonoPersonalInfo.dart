class MonoPersonalInfo {
  final String clientId;
  final String name;
  final String webHookUrl;
  final String permissions;
  final List<MonoAccount> accounts;

  MonoPersonalInfo(
      {required this.clientId,
      required this.name,
      required this.webHookUrl,
      required this.permissions,
      required this.accounts});

  factory MonoPersonalInfo.fromJson(Map<String, dynamic> json) {
    final accounts = json['accounts'];
    final entities = accounts
        .map((json) => MonoAccount.fromJson(json))
        .toList()
        .cast<MonoAccount>();

    return MonoPersonalInfo(
        clientId: json['clientId'],
        name: json['name'],
        webHookUrl: json['webHookUrl'],
        permissions: json['permissions'],
        accounts: entities);
  }
}

class MonoAccount {
  final String id;
  final int currencyCode;
  final String cashbackType;
  final List<String> maskedPan;
  final int balance;
  final String type;
  final String iban;

  MonoAccount(
      {required this.id,
      required this.currencyCode,
      required this.cashbackType,
      required this.balance,
      required this.maskedPan,
      required this.type,
      required this.iban});

  factory MonoAccount.fromJson(Map<String, dynamic> json) {
    return MonoAccount(
        id: json['id'],
        currencyCode: json['currencyCode'],
        cashbackType: json['cashbackType'],
        balance: json['balance'],
        maskedPan: json['maskedPan'].cast<String>(),
        type: json['type'],
        iban: json['iban']);
  }
}
