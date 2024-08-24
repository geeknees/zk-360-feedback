import { buildModule } from "@nomicfoundation/hardhat-ignition/modules";

const EvaluationHashStorageModule = buildModule(
  "EvaluationHashStorageModule",
  (m) => {
    // EvaluationHashStorageコントラクトのインスタンスをデプロイ
    const evaluationHashStorage = m.contract("EvaluationHashStorage", []);

    return { evaluationHashStorage };
  },
);

export default EvaluationHashStorageModule;
