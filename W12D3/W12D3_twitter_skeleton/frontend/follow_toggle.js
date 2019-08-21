const APIUtil = require('./api_util');

class FollowToggle {
  constructor(el, options) {
    this.$el = $(el);
    this.userId = this.$el.data('user-id') || options.userId;
    this.followState = (this.$el.data('initial-follow-state') ||
      options.followState);
    this.render();

    this.$el.on('click', this.handleClick.bind(this));
  }

  handleClick(event) {
    const followToggle = this;

    event.preventDefault();
    if (this.followState === "followed") {
      this.followState = "unfollowed";
      this.render();
      $.ajax({
        method: "DELETE",
        url: "/users/:user_id/follow",
        // success: ,
        // error: 
      });
    } else if (this.followState === "unfollowed") {
      this.followState = "followed";
      this.render();
      $.ajax({
        method: "POST",
        url: "/users/:user_id/follow",
        // success: ,
        // error: 
      });
    }
  }

  // 'followed': 'unfollowed'
  // why render method has four status.
  render() {
    switch (this.followState) {
      case 'followed':
        this.$el.prop('disabled', false);
        this.$el.html('Unfollow!');
        break;
      case 'unfollowed':
        this.$el.prop('disabled', false);
        this.$el.html('Follow!');
        break;
      case 'following':
        this.$el.prop('disabled', true);
        this.$el.html('Following...');
        break;
      case 'unfollowing':
        this.$el.prop('disabled', true);
        this.$el.html('Unfollowing...');
        break;
    }
  }
}

module.exports = FollowToggle
