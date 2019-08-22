import React from 'react';
const TodoListItem = ({item}) => (
    <div className='list-item'>
        <h3>
            {item.title}
        </h3>
        <span>
            {item.body}
        </span>
    </div>
    
)

export default TodoListItem;