const SimpleTokenCoin = artifacts.require("./SimpleTokenCoin.sol");
// let ERC20DividendsToken = artifacts.require("./ERC20DividendsToken.sol");
const web3 = global.web3;

contract('SimpleTokenCoin', (accounts) => {

    //initial params for testing

    // beforeEach(async function() {
    //     s = await s.new({from: accounts[0]});
    // });

    it("should return that owner is accounts[0]", async function() {
        let sct = await SimpleTokenCoin.new({from: accounts[0]});
        console.log((await sct.owner()).toString());
        assert.equal(await sct.owner(), accounts[0]);
    })

})