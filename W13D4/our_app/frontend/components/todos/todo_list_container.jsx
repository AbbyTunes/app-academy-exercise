import React from 'react';
import { connect } from 'react-redux';
import TodoList from './todo_list';
import allTodos from '../../reducers/selectors';
import { receiveTodo } from '../../actions/todo_actions';



const mapStateToProps = (state) => ({ //=> window.getState()
    todos: allTodos(state)
    //=> an array of state objects
});

// this.props.todos 

const mapDispatchToProps = (dispatch) => ({
    // receiveTodo(todo) returns an action
    // dispatch takes in an action
     
    receiveTodo: (todo) => dispatch(receiveTodo(todo))  
})

export default connect(mapStateToProps, mapDispatchToProps)(TodoList);
// connects presentational components with state and actions