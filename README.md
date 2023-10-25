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


## Beware of <-- 

The following circuit will have only one constraint.

With only one constraint, the prover only has to set the first element in the array correctly, but can put whatever value they like for the other 5! You cannot trust proofs that come out of a circuit like this!

```c
pragma circom 2.1.6;

template Powers {
  signal input a;
  signal output powers[6];
  
  powers[0] <== a;
  powers[1] <== a * a;
  powers[2] <-- a ** 3;
  powers[3] <-- a ** 4;
  powers[4] <-- a ** 5;
  powers[5] <-- a ** 6;
}

component main = Powers();
```
Underconstraints are a major source source of security bugs in zero knowledge applications, so triple check that the constraints are actually generated in the R1CS the way you expect them to!
