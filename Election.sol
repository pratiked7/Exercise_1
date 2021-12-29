pragma solidity >=0.5.9;

contract Election {

    mapping(bytes32 => uint8) public totalVotes;

    bytes32[] public candidates;

    constructor (bytes32[] memory names) {
        candidates = names;
    }

    modifier validity(bytes32 candidate){
        require(isValidCandidate(candidate));
        _;
    }

    function voteForCandidate(bytes32 candidate) validity(candidate) public {
        totalVotes[candidate] += 1;
    }

    function getVotes(bytes32 candidate) validity(candidate) public returns(uint8){
        return totalVotes[candidate];
    }

    function isValidCandidate(bytes32 candidate) public returns (bool) {
        for(uint i = 0; i < candidates.length; i++){
            if(candidates[i] == candidate){
                return true;
            }
        }
        return false;
    }
}

