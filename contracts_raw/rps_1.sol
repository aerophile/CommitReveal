pragma solidity ^0.4.19;

contract RockPaperScissors{

    struct Game{
        uint game_start_time; // time at which game started
        bool game_completed;  // is game complete
        address p1;           // address of player 1
        address p2;           // address of player 2
    }
    
    mapping (uint => string) gameIdToPlayerOneChoice; // stores response of player 1
    mapping (uint => string) gameIdToPlayerTwoChoice; // stores response of player 2
    
    Game[] public games;
    
    
    function firstMove(string memory  _p1Choice,address _p2Adress) public returns(uint){
        
        //player 1 creates a game and shares the gameId with player 2
        uint gameId =  games.push(Game(msg.value,now,false,msg.sender,_p2Adress));
        gameIdToPlayerOneChoice[gameId] = _p1Choice;
        return gameId;
    }
    
    function SecondMove(string memory _p2Choice,uint _gameId) public isPlayable(_gameId) {
        require(msg.sender == games[_gameId].p2);
        require(bytes(gameIdToPlayerTwoChoice[_gameId]).length == 0);
        gameIdToPlayerTwoChoice[_gameId] = _p2Choice;
        games[_gameId].game_pot+=msg.value;
    }
    
    modifier isPlayable(uint _gameId) {
        //checks to make sure that the game has not already ended
        require(! games[_gameId].game_completed);
        _;
    }
    
    
    //used to determine the winner of the game
    //based of github.com/SCBuergel/ethereum-rps/blob/master/rps.sol
    mapping (string => mapping(string => int)) payoffMatrix;
    
    function RockPaperScissors() public {
        payoffMatrix["rock"]["rock"] = 0;
        payoffMatrix["rock"]["paper"] = 2;
        payoffMatrix["rock"]["scissors"] = 1;
        payoffMatrix["paper"]["rock"] = 1;
        payoffMatrix["paper"]["paper"] = 0;
        payoffMatrix["paper"]["scissors"] = 2;
        payoffMatrix["scissors"]["rock"] = 2;
        payoffMatrix["scissors"]["paper"] = 1;
        payoffMatrix["scissors"]["scissors"] = 0;
    }
    
    
    uint minimum_eval_delay = 1 minutes; //15 minutes; 
    
    modifier delayPassed(uint _gameId){
        //makes sure that atleast minimum_eval_delay has passed
        // to allow sufficient time for player 2 to send their move
        require(now >= games[_gameId].game_start_time + minimum_eval_delay);
        _;
    }
    
    function evaluateWinner(uint _gameId) external isPlayable(_gameId) delayPassed(_gameId) {
        //sends reward to the winner
        //splits reward incase of a tie
       Game storage game_instance = games[_gameId];
       
       string memory p1_choice = gameIdToPlayerOneChoice[_gameId];
       string memory p2_choice = gameIdToPlayerTwoChoice[_gameId];
       
       address p1 = address(uint160(game_instance.p1));
       address p2 = address(uint160(game_instance.p2));
       
       if (uint(payoffMatrix[p1_choice][p2_choice]) == 1){ //player 1 wins
          
           p1.transfer(game_instance.game_pot);
       } 
       
       else if (uint(payoffMatrix[p1_choice][p2_choice]) == 2){ 
           //player 2 wins
           p2.transfer(game_instance.game_pot);
       }
       
       else if (bytes(p2_choice).length == 0){ 
           //player 1 withdraws
           p1.transfer(game_instance.game_pot);
       }
       
       else { //game is tied 
           uint refund_amount = game_instance.game_pot / 2;
           p1.transfer(refund_amount);
           p2.transfer(refund_amount);
       }
       game_instance.game_completed = true;
       game_instance.game_pot = 0;
       
    }
}