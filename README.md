# Car Market contract
### Task 1: Data structures
1. Create **Car** and **CarOwner** structures.
The first one should includes the following properties:
```
1) price
2) manufacturer
3) configOfModel as mapping (model => number of config)
4) petrolConsumptionPerMile
5) signature
6) presence
```
The second one should contains the following properties:
```
1) addr
2) discount
3) carIDs
```
2. Create next variables:
```
1) carDiller
2) carID (this variable should starts from 1)
3) carOwnerID (this variable should starts from 1)
4) cars mapping (carID => car)
5) carOwners mapping (carOwnerID => car owner)
6) carOwner mapping (owner's address => carOwnerID)
```
**Prompt:** `carIDs` property in `CarOwner` structure should stores only `MAX_CARS_PER_PERSON` unique identifiers.
### Task 2: Library
Add `SafeMath` library to `CarMarket` contract.
### Task 3: Setter function
Create function which will creates new Car object. Call it as `addCar`.
1. Get `c` variable type `Car` declared as a storage pointer.
2. Add all properties to `Car` object.
3. Increment `carID` variable.
### Task 4: Modifier. Require statement.
Create `onlyCarDiller` modifier that will allows to give access only for `carDiller`.
Add this modifier to `addCar` function.
### Task 5: Payable function. Msg.sender, msg.value. Conditional statements. Loop. Transfer method.
Create `payable` function called `buyCar` with one parameter called `_carID`. This function will accept ETH from buyers.

First, we prepare the variables for our function:
1. Let's say that `carID == 0` is a empty index that doesn't contain any car. It will come in handy in the future to get buyer's cars. Create variable `NULL_CAR` with zero value.
2. Create `NOT_CAR_OWNER` variable with zero value.
   And `CAR_OWNER` variable with value `1`.
   Create mapping `isCarOwner` there person address => person state.
   If person has never bought any car his person state will be NOT_CAR_OWNER, else - CAR_OWNER.
3. Create `DECIMAL_MULTIPLIER` variable with value `1e18`. This variable will need us for calculating later.
4. Create `IN_STOCK` and `OUT_OF_STOCK` variables with values `true` and `false` respectively.

Let's start to code our `buyCar` function:
1. The `carDiller` can't buy a car.
2. Parameter `_carID` should be less or equal last `carID`.
**Prompt:** `carID` variable contains future car unique identifier.
3. Parameter `_carID` shouldn't be equals to `NULL_CAR`.
4. Create car instance by `_carID` unique identifier.
5. Car should be `IN_STOCK`.
6. Create local variable called `_carPrice` that will contains the price of selected car.
7. Let's check: if `msg.sender` buy car at first time.
**Prompt:** remember the `isCarOwner` variable and `NOT_CAR_OWNER` person state.
8.