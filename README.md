# Notary
OILt.io notary smart contract.

#### Owner Functions:

*kill

*notarize(string)

*storeProof(bytes32)
___

#### Public Functions:

*checkDocument(string)

*proofFor(string)

*hasProof(bytes32)



The OILt Notary will serve as a verifiable way of providing proof that documents stay in their original format. In this way we are looking to prevent potential problems when it comes to displaying the authenticity of a document.

In this way the actual document is not stored on the Ethereum blockchain, only a MD5 Checksum. Once the original docmuents MD5 has been "notarized" any member of the public will be able to verify the document using the "checkDocument" call.
