onst APIUtil = {
  followUser: id => {
    APIUtil.changeFollowStatus(id, 'POST')
  },
  // what is this object? a function?
  // why use comma, like arguments

  unfollowUser: id => {
    APIUtil.changeFollowStatus(id, 'DELETE')
  }

  changeFollowStatus: (id, method) => (
      $.ajax({
          url: `/users/${id}/follow`,
          dataType: 'json',
          method
          // what is this method?
      })
  )
};

module.exports = APIUtil;