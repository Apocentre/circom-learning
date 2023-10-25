Replace `multiply.circom` with a specific template file

## Complile to check for error

`circom multiply.circom`


## Generate R1CS and variables files

`circom multiply.circom --r1cs --sym`

## Read R1CS

You can read R1CS binary file with the help of `snarkjs`

`snarkjs r1cs print multiply.r1cs`

This will pring the R1CS constraint system. For more information read [this](https://www.rareskills.io/post/rank-1-constraint-system) article 


## Generate the Witness vector

`circom multiply.circom --r1cs --sym --wasm`

## Add values to the witness vector

Next, we need to create an `input.json` file in the folder created after running the previous command. This is a map from the names of the signals designated input to the value that the prover will supply to them.

For example

`{"a": "2","b": "3","c": "5"}`

## Calculate Witness

Run the following command in the folder (e.g. multiply_js) created after running the previous command. 

`node generate_witness.js multiply.wasm input.json witness.wtns`

## Export Witness

```bash
snarkjs wtns export json witness.wtns
cat witness.json
```

This follows the expected layout of the R1CS variables in the form `[1, out, a, b, c, s1]`. Read about this [here](https://www.rareskills.io/post/rank-1-constraint-system)
