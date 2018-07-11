const OneCoin = artifacts.require('./OneSmartToken.sol');
const OneCrowdsale = artifacts.require('./OneCrowdsale.sol');

module.exports = function (deployer, network, accounts) {
  // Change to real params when deploying to eth node

  const openingTime = web3.eth.getBlock(web3.eth.blockNumber).timestamp + 10; // 10 seconds from now;
  const closingTime = openingTime + 86400 * 20; // 20 days
  const rate = new web3.BigNumber(1000);

  const wallet = accounts[0];     
  const walletTeam = accounts[1]; 
  const walletAdvisers = accounts[2]; 
  const walletFounders = accounts[3]; 
  const walletReserve = accounts[4];

  const cap = new web3.BigNumber(1000);
  const goal = new web3.BigNumber(1001);

  return deployer.then(() => deployer.deploy(OneCoin)).then(() => deployer.deploy(OneCrowdsale, 
                                                                                  openingTime, 
                                                                                  closingTime, 
                                                                                  rate, 
                                                                                  walletTeam,
                                                                                  walletAdvisers,
                                                                                  walletFounders,
                                                                                  walletReserve,
                                                                                  cap,
                                                                                  goal, 
                                                                                  OneCoin.address));
};
