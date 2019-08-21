const FollowToggle = require("./follow_toggle");

// $(document).on("ready", function () { 
//   // console.log("hello"); 
//   const follow_toggle = new FollowToggle();
// });

$(function () {
  $('button.follow-toggle').each((i, btn) => new FollowToggle(btn, {}));
});


// You can use jQuery#each for this, but beware: 
// the DOM element is the second callback argument; index comes first.

