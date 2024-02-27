class PassbookModel {
  String? walletAmt;
  String? holdAmt;
  List<TransactionHistory>? transactionHistory;
  String? msg;
  bool? status;

  PassbookModel(
      {this.walletAmt,
        this.holdAmt,
        this.transactionHistory,
        this.msg,
        this.status});

  PassbookModel.fromJson(Map<String, dynamic> json) {
    walletAmt = json['wallet_amt'];
    holdAmt = json['hold_amt'];
    if (json['transaction_history'] != null) {
      transactionHistory = <TransactionHistory>[];
      json['transaction_history'].forEach((v) {
        transactionHistory!.add( TransactionHistory.fromJson(v));
      });
    }
    msg = json['msg'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['wallet_amt'] = walletAmt;
    data['hold_amt'] = holdAmt;
    if (transactionHistory != null) {
      data['transaction_history'] =
          transactionHistory!.map((v) => v.toJson()).toList();
    }
    data['msg'] = msg;
    data['status'] = status;
    return data;
  }
}

class TransactionHistory {
  String? transactionId;
  String? amount;
  String? transactionType;
  String? transactionNote;
  String? transferNote;
  String? amountStatus;
  String? insertDate;
  String? txRequestNumber;
  String? currentAmount;
  String? previousAmount;

  TransactionHistory(
      {this.transactionId,
        this.amount,
        this.transactionType,
        this.transactionNote,
        this.transferNote,
        this.amountStatus,
        this.insertDate,
        this.txRequestNumber,
        this.currentAmount,
        this.previousAmount});

  TransactionHistory.fromJson(Map<String, dynamic> json) {
    transactionId = json['transaction_id'];
    amount = json['amount'];
    transactionType = json['transaction_type'];
    transactionNote = json['transaction_note'];
    transferNote = json['transfer_note'];
    amountStatus = json['amount_status'];
    insertDate = json['insert_date'];
    txRequestNumber = json['tx_request_number'];
    currentAmount = json['current_amount'];
    previousAmount = json['previous_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['transaction_id'] = transactionId;
    data['amount'] = amount;
    data['transaction_type'] = transactionType;
    data['transaction_note'] = transactionNote;
    data['transfer_note'] = transferNote;
    data['amount_status'] = amountStatus;
    data['insert_date'] = insertDate;
    data['tx_request_number'] = txRequestNumber;
    data['current_amount'] = currentAmount;
    data['previous_amount'] = previousAmount;
    return data;
  }
}
