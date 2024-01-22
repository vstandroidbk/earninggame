class StarlineGameResultModel {
  bool? status;
  List<GameResult>? gameResult;

  StarlineGameResultModel({this.status, this.gameResult});

  StarlineGameResultModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['game_result'] != null) {
      gameResult = <GameResult>[];
      json['game_result'].forEach((v) {
        gameResult!.add(GameResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (gameResult != null) {
      data['game_result'] = gameResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GameResult {
  String? gameName;
  String? gameResult;

  GameResult({this.gameName, this.gameResult});

  GameResult.fromJson(Map<String, dynamic> json) {
    gameName = json['game_name'];
    gameResult = json['game_result'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['game_name'] = gameName;
    data['game_result'] = gameResult;
    return data;
  }
}
