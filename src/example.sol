// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

interface IVerifier {
    function verifiyProof(
        bytes memory _proof,
        uint256[6] memory _input
    ) external returns (bool);
}

contract example {
    IVerifier public immutable verifier;
    mapping(address => bool) public allowed;

    constructor(IVerifier _verifier) {
        verifier = _verifier;
    }

    function verifyUser(bytes calldata proof) public {
        require(!allowed[msg.sender], "already veridied ");
        verifier.verifiyProof(proof, _input);
    }
}
