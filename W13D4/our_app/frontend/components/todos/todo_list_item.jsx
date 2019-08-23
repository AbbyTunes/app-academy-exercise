import React from 'react';
const TodoListItem = ({item}) => (
    <li className='list-item'>
        <h3>
            {item.title}
        </h3>
        <span>
            {item.body}
        </span>
    </li>
    
)

export default TodoListItem;