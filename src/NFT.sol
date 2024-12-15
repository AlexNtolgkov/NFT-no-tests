//SPDX-License-Identifier: MIT
pragma solidity 0.8.27;
import {ERC721} from "../lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract NFT is ERC721{
    uint256 private s_tokenCounter;
    mapping(uint256 => string) private s_TokenIDtoURI;

    constructor() ERC721("NFTToken", "NFT") {
        s_tokenCounter = 0;
    }

    function mintNFT(string memory tokenUri) public {
        s_TokenIDtoURI[s_tokenCounter] = tokenUri;
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter++;
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        return s_TokenIDtoURI[tokenId];

    }
}