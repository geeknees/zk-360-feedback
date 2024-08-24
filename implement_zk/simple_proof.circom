pragma circom 2.0.0;

// TODO: markle treeを使って評価を入力済みか検証するように変更する
// 下記は簡易実装のため、ユーザーハッシュと期待されるハッシュが一致しているかを検証する

template SimpleProof() {
    signal input user_hash; // 入力としてのユーザーハッシュ
    signal input expected_hash; // 期待されるハッシュ（正しいもの）
    signal output is_valid; // 検証結果
    signal diff; // 差分を格納する信号

    // 入力されたハッシュと期待されるハッシュの差を計算
    diff <== user_hash - expected_hash;

    // 差がゼロであるかをチェック
    is_valid <== 1 - diff * diff;
}

component main = SimpleProof();