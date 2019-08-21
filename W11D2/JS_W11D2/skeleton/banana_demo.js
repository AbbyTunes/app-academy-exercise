

function makeRequestToOurOldPalRails(data, whatToDoWhenTheDataComesBack) {
  // making a server request (general async code)
  // setTimeout is simulating sending an actual HTTP request to our Rails server
  setTimeout(() => {
    // set bananas to the simulated HTTP Response
    let bananas = { data: `${data.data.numBananas} bananas` };
    whatToDoWhenTheDataComesBack(bananas);
  }, 1000);
  // come back to this ??? NO
  // return bananas;
}

function eat(bananas) {
  console.log(`eating ${bananas.data}!!!!111`)
}

function getBananasAndEatThemAll(numBananas) {
  makeRequestToOurOldPalRails({
    method: "GET",
    url: "/bananas",
    data: {
      numBananas: numBananas
    }
  }, /* Callback function */ (bananasFromRails) => {
    // do whatever I want with the bananas
    eat(bananasFromRails);
  });

  // Could techincally just pass eat() instead of passing a lambda
  // that calls eat().  They have the same function signature so
  // they are equivalent...
  // makeRequestToOurOldPalRails({
  //   method: "GET",
  //     url: "/bananas",
  //       data: {
  //     numBananas: numBananas
  //   }
  // }, /* Callback function */ eat);
  // whatToDoWhenTheDataComesBack is now eat
  // 

}

getBananasAndEatThemAll(5);
getBananasAndEatThemAll(1000000005);
getBananasAndEatThemAll(45);
getBananasAndEatThemAll(4312);