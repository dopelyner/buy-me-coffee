// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract BuyMeACoffee {

    // Event to emit when a Memo is created
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    // List of all memos received from friends
    Memo[] memos;
    
    // Addres of contract deployer
    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    /// @dev buy a cofee for contract owner
    /// @param _name name of the cofeee buyer
    /// @param _message a nice message from the cofee buyer
    function buyCoffee(string memory _name, string memory _message) public payable {
        require(msg.value > 0, "Can't buy cofee with 0 eth");

        // Add memo to storage !
        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        emit NewMemo(msg.sender, block.timestamp, _name, _message);
    }

    /// @dev send the entire balance stored in this contract to the owner
    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }

    /// @dev retreive all the memos received and stored on the blockchain
    function getMemos() public view returns(Memo[] memory) {
        return memos;
    }
}
