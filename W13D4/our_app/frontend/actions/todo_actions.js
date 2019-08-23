export const RECEIVE_TODOS = 'RECEIVE_TODOS';
export const RECEIVE_TODO = 'RECEIVE_TODO';
import * as apiUtil from '../util/apiUtil';

debugger
export const receiveTodos = (todos) => {
    return {
        type: RECEIVE_TODOS,
        todos: todos
    };
};

export const receiveTodo = (todo) => {
    return {
        type: RECEIVE_TODO,
        todo: todo
    }
};

export const fetchTodos = () => {
    return (dispatch) => {
        return apiUtil.fetchTodos().then( todos => {
            store.dispatch(receiveTodos(todos))
        });
    };  
};


window.receiveTodos = receiveTodos;
window.receiveTodo = receiveTodo;
window.fetchTodos = fetchTodos;