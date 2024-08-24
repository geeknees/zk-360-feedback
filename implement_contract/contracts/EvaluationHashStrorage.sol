// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract EvaluationHashStorage {
    // 評価のハッシュを保存するマッピング
    mapping(address => bytes32) public evaluationHashes;

    // 評価のハッシュを保存する
    function storeEvaluationHash(address evaluator, bytes32 _evaluationHash) public {
        evaluationHashes[evaluator] = _evaluationHash;
    }

    // 保存された評価ハッシュを取得
    function getEvaluationHash(address evaluator) public view returns (bytes32) {
        return evaluationHashes[evaluator];
    }

    // 評価のハッシュが一致するかを検証
    function verifyEvaluationHash(address evaluator, bytes32 _evaluationHash) public view returns (bool) {
        return evaluationHashes[evaluator] == _evaluationHash;
    }
}