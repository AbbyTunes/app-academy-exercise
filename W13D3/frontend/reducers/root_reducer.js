import { combineReducers } from 'redux';
import todosReducer from './todos_reducer';
import allTodos from './selectors';

const rootReducer = combineReducers({
    todos: todosReducer
})

export default rootReducer;