var Migrations = artifacts.require("./Migrations.sol");
// var MultiArgue = artifacts.require("./MultiArgue.sol");
var SimpleArgue = artifacts.require("./SimpleArgue.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  // deployer.deploy(MultiArgue);
  deployer.deploy(SimpleArgue);
};