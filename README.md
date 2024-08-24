# zk360

A 360-degree feedback system that allows evaluations to be conducted anonymously using zero-knowledge proofs.

## Contract

- Address: 0x968536167d4bCbD88b35a6E12787E323400D6B8E
- Scrollscan: [https://sepolia.scrollscan.com/address/0x968536167d4bCbD88b35a6E12787E323400D6B8E](https://sepolia.scrollscan.com/address/0x968536167d4bCbD88b35a6E12787E323400D6B8E)

## Overview

- Enables anonymous 360-degree feedback.
- Evaluators assess the target individuals based on multiple questions.
- The evaluation results are published anonymously.
- (Tentative) Both the evaluators and the evaluated individuals can see the evaluation results and understand how they were rated.

## Mechanism

- Administrators register organizations when users are registered.
- Users belonging to an organization can perform 360-degree evaluations within the organization.
- When registering evaluations, the evaluator’s information is not linked, maintaining anonymity.

## Is that all? Aren’t you using blockchain or anything?

- Yes, we are.
- To ensure anonymity while preventing fraudulent multiple submissions, the system is designed using zero-knowledge proofs (ZK Proofs) and blockchain technology.
- To allow only one evaluation per user, the system verifies whether an evaluator has already submitted an evaluation using zero-knowledge proofs and a Merkle tree.
- Blockchain is used to store evaluation results, making them tamper-proof and ensuring overall transparency.

## Specific Mechanism

1. Hash and store the evaluator’s identification information.
2. Create a Merkle tree to verify whether an evaluator has already submitted an evaluation.
3. Create a zero-knowledge proof to verify whether an evaluator has already submitted an evaluation.
4. Store the evaluation results on the blockchain.

## System Design Flow

1. **User Registration**
   - Administrators register users and generate hashed identification information for each user.

2. **Evaluation Process**
   - Evaluators conduct assessments anonymously. During this process, they use a zero-knowledge proof to verify that they have not yet submitted an evaluation.
   - Once this proof is verified, the evaluation is accepted, and the results are recorded on the blockchain.

3. **Prevention of Multiple Submissions**
   - During the evaluation, the evaluator’s hash is checked using a Merkle tree. Once a proof is successfully verified, the evaluator cannot submit the same evaluation again (controlled using ZK Proof verification).

# zk360

ゼロ知識証明の考えを利用した匿名でおこなえる360度評価システムです。

## 概要

- 360度評価を匿名でおこなうことができます。
- 評価者は評価対象者に対して、複数の質問に対して評価をおこないます。
- 評価結果は匿名で公開されます。
- （仮）評価結果は、評価者と評価対象者の双方に対して、評価結果がどのようなものであるかを知ることができます。

## 仕組み

- 管理者はユーザ登録時に組織を登録します。
- 組織に所属するユーザは、組織内で360度評価をおこなうことができます。
- 評価を登録する際は、評価者の情報を紐づけないことで匿名性を保ちます。

## それだけ？ブロックチェーンとか使わないの？

- 使います。
- 評価者の匿名性を保ちながら、不正な多重投稿を防ぐ仕組みを設計するには、ゼロ知識証明（ZK Proof）とブロックチェーン技術を活用します。
- 一度だけ評価できるようにするため、評価者がすでに評価を行ったかどうかをゼロ知識証明とMerkleツリーを使って検証します。
- ブロックチェーンを活用して、評価結果の改ざんを防止し、全体の透明性を確保します。

## 具体的な仕組み

1. 評価者の識別情報をハッシュ化して保存
2. 評価者がすでに評価を行ったかどうかを検証するためのMerkleツリーを作成
3. 評価者が評価を行ったかどうかを検証するためのゼロ知識証明を作成
4. 評価結果をブロックチェーンに保存

## システム設計のフロー

1. ユーザー登録
    - 管理者がユーザーを登録し、各ユーザーに対してハッシュ化された識別情報を生成します。

2. 評価プロセス
    - 評価者は、匿名で評価を行います。この際、ゼロ知識証明を使って「自分がまだ評価を行っていないこと」を証明します。
    - この証明が成功すると、評価が受け付けられ、結果がブロックチェーンに記録されます。

3. 多重投稿の防止
    - 評価を行う際、評価者のハッシュ値がMerkleツリーを使って検証されます。一度証明が成功すると、その評価者は同じ評価を再度行うことができなくなります（ZK Proofを使った検証で制御）。

