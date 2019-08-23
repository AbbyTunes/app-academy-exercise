import {RECEIVE_TODOS, RECEIVE_TODO, receiveTodos, receiveTodo} from '../actions/todo_actions';

const initialState = {
    1: {
        id: 1,
        title: 'wash car',
        body: 'with soap',
        done: false
    },
    2: {
        id: 2,
        title: 'wash dog',
        body: 'with shampoo',
        done: true
    },
};

const todosReducer = (state = initialState, action) => {
    Object.freeze(state);
    switch (action.type) {
        case RECEIVE_TODOS:
            
            const newTodos = action.todos;
            const newObject = {};
            newTodos.forEach(el => {
                newObject[el.id] = el;
            });
            return newObject;

        case RECEIVE_TODO:
            
            const newTodo = action.todo; // array
            return Object.assign({}, state,
            {
                [newTodo.id]: newTodo                
            });

        default:
            return state;
    }
};

export default todosReducer;


