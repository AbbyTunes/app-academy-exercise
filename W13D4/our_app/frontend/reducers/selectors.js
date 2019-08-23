import todosReducer from './todos_reducer';

const allTodos = (state) => {
    return Object.keys(state.todos).map(id => state.todos[id]);
};

window.allTodos = allTodos;

export default allTodos;