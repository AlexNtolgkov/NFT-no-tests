//SPDX-License-Identifier: MIT
pragma solidity 0.8.27;
import {Script} from "forge-std/Script.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {NFT} from "../src/NFT.sol";
contract InteractionsNFT is Script{

    string public constant Girl = "ipfs://bafkreictv3p474nfilkyufpkeh2kqvll5kwxwobtupxpvesxpsufjc2xym"; 

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment("NFT", block.chainid);
        MintNFTonContract(mostRecentlyDeployed);
    }

    function MintNFTonContract(address contractAddress) public {
        vm.startBroadcast();
        NFT(contractAddress).mintNFT(Girl);
        vm.stopBroadcast();
    }

}