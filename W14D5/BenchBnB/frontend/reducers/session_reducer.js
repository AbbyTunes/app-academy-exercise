import { RECEIVE_CURRENT_USER, LOGOUT_CURRENT_USER } from "../actions/session_actions";


const defaultState = Object.freeze({id: null});

const sessionReducer = (state = defaultState, action) => {
  Object.freeze(state);
  switch (action.type) {
    case RECEIVE_CURRENT_USER:
      return {id: action.currentUser.id};
    case LOGOUT_CURRENT_USER:
      return defaultState;
    default:
      return state;
  }
};
// let newState = Object.assign({}, state);
// newState.user.id = null;
// return newState;

// 5: {
//         id: 5,
//         username: 'breakfast'
//       }

export default sessionReducer;