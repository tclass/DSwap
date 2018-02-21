var dswapProduct = artifacts.require("./contracts/DSwapProduct.sol");

module.exports = function(deployer) {
    // deployment steps
    deployer.deploy(dswapProduct);
};