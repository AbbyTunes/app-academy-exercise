import React from 'react';
import TodoListItem from './todo_list_item';
import TodoForm from './todo_form';
import apiUtil from '../../util/apiUtil';

class TodoList extends React.Component {
    constructor(props){
        super(props)
    }

    render() {
        
        const { todos, receiveTodo } = this.props;

        const todosLis = todos.map((item, idx) => {
            return <TodoListItem item={item} key={idx} />
        });

        return (
            <div className='todo-list'>
                <ul>
                    {todosLis}
                </ul>
                <TodoForm receiveTodo={receiveTodo} />
            </div>
        );
        
    }
}

    

export default TodoList;