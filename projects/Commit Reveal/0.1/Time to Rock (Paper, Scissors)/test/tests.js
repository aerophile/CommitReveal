const Contract = artifacts.require('RockPaperScissors');
contract('Contract', function (accounts) {
    let contract;
    const sender = accounts[0];
    beforeEach(async () => {
        contract = await Contract.new({
            from: sender
        });
    });

    it('should have struct named Games', async () => {
        
        assert.equal(contract.Games, "Structre Games is not defined");
    });

    it('should have a struct named Games with property named player1 of type address ', async () => {

        assert.equal(contract.Games.player1,"property named player1 of type address not defined in struct Games ");
    });


    it('should have a struct named Games with property named player2 of type address ', async () => {

        assert.equal(contract.Games.player2, "property named player2 of type address not defined in struct Games ");
    });

    it('should have a struct named Games with property named game_pot of type uint256 ', async () => {

        assert.equal(contract.Games.game_pot, "property named game_pot of type uint256 not defined in struct Games ");
    });
});