// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";

contract CustomERC20Token is ERC20, Ownable, Pausable {
    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialSupply_
    ) ERC20(name_, symbol_) {
        _mint(msg.sender, initialSupply_ * 10**uint256(decimals_));
    }

    // Read Only Functions
    function decimals() public view override returns (uint8) {
        return super.decimals();
    }

    // Writable Functions
    function transfer(address _to, uint256 _value)
        public
        override
        returns (bool success)
    {
        return super.transfer(_to, _value);
    }

    function transferFrom(address _from, address _to, uint256 _value)
        public
        override
        returns (bool success)
    {
        return super.transferFrom(_from, _to, _value);
    }

    function approve(address _spender, uint256 _value)
        public
        override
        returns (bool success)
    {
        return super.approve(_spender, _value);
    }

    // Custom Functions
    function burn(uint256 _amount) external returns (bool success) {
        _burn(msg.sender, _amount);
        return true;
    }

    function mint(address _to, uint256 _amount) external onlyOwner returns (bool success) {
        _mint(_to, _amount);
        return true;
    }

    function pause() external onlyOwner returns (bool success) {
        _pause();
        return true;
    }

 
    function transferOwnership(address _newOwner) public override onlyOwner  {
        super.transferOwnership(_newOwner);
        //  return true;
    }
}
