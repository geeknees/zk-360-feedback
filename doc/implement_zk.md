setup
https://docs.circom.io/getting-started/installation/
```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh

git clone https://github.com/iden3/circom.git
cargo build --release
cargo install --path circom

npm install -g snarkjs
```


prove -> verify
```
node ./simple_proof_js/generate_witness.js ./simple_proof_js/simple_proof.wasm input.json witness.wtns
snarkjs groth16 prove simple_proof_0001.zkey witness.wtns proof.json public.json
snarkjs groth16 verify verification_key.json public.json proof.json
```

compile
```
circom simple_proof.circom --r1cs --wasm --sym
node ./simple_proof_js/generate_witness.js ./simple_proof_js/simple_proof.wasm input.json witness.wtns
snarkjs powersoftau new bn128 12 pot12_0000.ptau -v
snarkjs powersoftau contribute pot12_0000.ptau pot12_0001.ptau --name="First contribution" -v
snarkjs powersoftau prepare phase2 pot12_0001.ptau pot12_final.ptau -v
snarkjs groth16 setup simple_proof.r1cs pot12_final.ptau simple_proof_0000.zkey
snarkjs zkey contribute simple_proof_0000.zkey simple_proof_0001.zkey --name="1st Contributor Name" -v
snarkjs zkey export verificationkey simple_proof_0001.zkey verification_key.json
snarkjs groth16 prove simple_proof_0001.zkey witness.wtns proof.json public.json
snarkjs groth16 verify verification_key.json public.json proof.json
```