## Public Inputs
What if we want to make some of the inputs public? In nullifier schemes for example, we hash the concatenation of two numbers and reveal one of them later.

## Nullifier schemes

As a quick aside, a nullifier scheme works by concatenating two numbers and then hashing them. They are used in the context where we have a set of hashes, and we want to prove we know the preimage to one of them without revealing which one it is.

By revealing one of the two hashed numbers, we cannot re-use the preimage, but we also don’t reveal which hash we know the preimage of because revealing only one of the two numbers isn’t sufficient.
