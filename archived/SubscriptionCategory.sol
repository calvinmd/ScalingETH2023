// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@moleculeprotocol/molecule-core/src/IMoleculeAddress.sol";

contract Subscription {
    struct Category {
        uint ethRequired;
        uint pointsGiven;
    }
    mapping(uint => Category) public categories;
    mapping(address => uint) public userPoints;
    mapping(address => uint) public userCategory;
    mapping(address => bool) public isSubscribed;
    event Subscribed(
        address indexed user,
        uint indexed category,
        uint ethPaid,
        uint pointsGiven
    );
    event Unsubscribed(address indexed user);
    event Redeemed(address indexed user, uint pointsUsed);
    event ETHWithdrawn(address indexed owner, uint amount);
    address private _owner;
    address private _molecule_address_general_AML =
        0x692f0Ac3eDDF405C8a864643DC104b3B01F594C2;
    address private _molecule_address_access_list =
        0x692f0Ac3eDDF405C8a864643DC104b3B01F594C2;

    constructor() {
        _owner = msg.sender;
    }

    modifier onlyOwner() {
        require(
            msg.sender == _owner,
            "Only contract owner can call this function"
        );
        _;
    }

    function setCategory(
        uint categoryId,
        uint ethRequired,
        uint pointsGiven
    ) external onlyOwner {
        categories[categoryId] = Category(ethRequired, pointsGiven);
    }

    function subscribe(uint categoryId) external payable {
        require(
            IMoleculeAddress(_molecule_address_general_AML).check(msg.sender),
            "Molecule AML : access denied "
        );
        require(
            IMoleculeAddress(_molecule_address_access_list).check(msg.sender),
            "Molecule Allowlist : access denied "
        );
        Category memory category = categories[categoryId];
        require(category.ethRequired > 0, "Invalid category");
        require(!isSubscribed[msg.sender], "Already subscribed");
        require(msg.value == category.ethRequired, "Invalid amount");
        uint points = category.pointsGiven;
        userCategory[msg.sender] = categoryId;
        userPoints[msg.sender] += points;
        isSubscribed[msg.sender] = true;
        emit Subscribed(msg.sender, categoryId, msg.value, points);
    }

    function unsubscribe() external {
        require(isSubscribed[msg.sender], "Not subscribed");
        uint points = userPoints[msg.sender];
        userPoints[msg.sender] = 0;
        userCategory[msg.sender] = 0;
        isSubscribed[msg.sender] = false;
        emit Unsubscribed(msg.sender);
        if (points > 0) {
            emit Redeemed(msg.sender, points);
        }
    }

    function redeem() external {
        require(isSubscribed[msg.sender], "Not subscribed");
        uint points = userPoints[msg.sender];
        require(points >= 10, "Insufficient points");
        userPoints[msg.sender] -= 10;
        emit Redeemed(msg.sender, 10);
    }

    function withdrawETH(address payable destination) external onlyOwner {
        uint balance = address(this).balance;
        require(balance > 0, "No balance to withdraw");
        (bool success, ) = destination.call{value: balance}("");
        require(success, "Failed to withdraw ETH");
        emit ETHWithdrawn(_owner, balance);
    }
}
