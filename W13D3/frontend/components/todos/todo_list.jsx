import React from 'react';
import TodoListItem from './todo_list_item';

const TodoList = ({ todos, receiveTodo }) => {
    const todosLis = todos.map((item, idx) => {
        return <TodoListItem item={item} key={idx} />
    });

    return (
        <div className='todo-list'>
            <ul>
                {todosLis}
            </ul>
        </div>
    );
};
    

export default TodoList;