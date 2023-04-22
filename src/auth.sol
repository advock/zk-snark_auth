// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

// A dapp needes an authorization
// here a smart contract is verifier
// an user is a prover
//  why do users need to prove to dapp with zk and not pass ?
//  how dapp can know that this user/s pass is okay?
//  does such dapp exist that need auth to access ?
//  example of our idea :-
//  lets build something a contract that will use its own address and users paramater
//  .. someone with proof can change some values in contract proving that they have sensetive info
//   somethig like if you give an prof of having a password to a smart contract it will call function in another smart contract which will
//  assign you as part of orginazation and hence you will have ability to access some funcation
//
//   so we will build a smart contract which will verifity
//   now this contract will have an ability to assign empoyes if the proof is verified correctely
//
// now who will create a password
// ofcos the creator of the contract will give password access to user and this user will provide proof to contract to assign him as employe
//

library Paring {
    uint256 constant PRIME_Q =
        21888242871839275222246405745257275088696311157297823662689037894645226208583;

    struct G1Point {
        uint256 X;
        uint256 Y;
    }

    // Encoding of field elements is: X[0] * z + X[1]
    struct G2Point {
        uint256[2] X;
        uint256[2] Y;
    }

    function negate(G1Point memory p) internal pure returns (G1Point memory) {
        // The prime q in the base field F_q for G1
        if (p.X == 0 && p.Y == 0) {
            return G1Point(0, 0);
        } else {
            return G1Point(p.X, PRIME_Q - (p.Y % PRIME_Q));
        }
    }
}
