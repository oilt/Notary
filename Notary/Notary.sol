pragma solidity ^0.4.18;
contract owned {

    address owner;

    /*this function is executed at initialization and sets the owner of the contract */
    function owned() public { owner = msg.sender; }

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
}

contract mortal is owned {

    /* Function to recover the funds on the contract */
    function kill() onlyOwner() public {
        selfdestruct(owner);
    }

}
// Proof of Existence contract, version 3
contract ProofOfExistence3 is owned, mortal {
  mapping (bytes32 => bool) private proofs;
  // store a proof of existence in the contract state
  function storeProof(bytes32 proof) public {
    proofs[proof] = true;
  }
  // calculate and store the proof for a document
  function notarize(string document) public {
    var proof = proofFor(document);
    storeProof(proof);
  }
  // helper function to get a document's sha256
  function proofFor(string document) pure public returns (bytes32) {
    return sha256(document);
  }
  // check if a document has been notarized
  function checkDocument(string document) constant public returns (bool) {
    var proof = proofFor(document);
    return hasProof(proof);
  }
  // returns true if proof is stored
  function hasProof(bytes32 proof) constant public returns(bool) {
    return proofs[proof];
  }
}