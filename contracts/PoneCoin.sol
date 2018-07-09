pragma solidity ^0.4.19;

import 'zeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract PoneCoin is StandardToken {
    string public name = "PONE COIN";
    string public symbol = "ONE";
    uint8 public decimals = 0;

    uint256 public constant INITIAL_SUPPLY = 630000000;

  /**
   * @dev Constructor that gives msg.sender all of existing tokens.
   */
  constructor() public {
    totalSupply_ = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    emit Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }
}
