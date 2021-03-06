pragma solidity ^0.4.18;


import '../../contracts/crowdsale/PreSaleCrowdsale.sol';


// mock class using PreSaleCrowdsale
contract PreSaleCrowdsaleMock is PreSaleCrowdsale {

  function PreSaleCrowdsaleMock(uint256 _openingTime, uint256 _closingTime, uint256 _rate, uint256 _softCap, uint256 _hardCap) 
  public
  Crowdsale(_openingTime, _closingTime, _rate, _softCap, _hardCap) {
  
  }

  function setZeroAddressToInvestorWallet(address _wallet) {
    if (investorsMap[_wallet].wallet == address(0)) {
      return;
    }

    investorsMap[_wallet].wallet = address(0);
  }

  function addFakePreSaleDeal(address _incomeWallet, address _wallet) {
    PreSaleConditions storage investor = investorsMap[_incomeWallet];

    investor.wallet = _wallet;
  }
}