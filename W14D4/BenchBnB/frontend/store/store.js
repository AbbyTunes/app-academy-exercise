import { createStore, applyMiddleware } from 'redux';
import logger from 'redux-logger';
import thunk from 'redux-thunk'; 
import rootReducer from '../reducers/root_reducer';
// from file, from redux-thunk


const configureStore = (preloadedState = {}) => (
  createStore(rootReducer, preloadedState, applyMiddleware(thunk, logger))
);

export default configureStore;

// fn {
//   const something = word => expression;

//   const configureStore = (preloadedState = {}) => (
//     createStore(rootReducer, preloadedState, applyMiddleware(thunk, logger))
//   );
// }