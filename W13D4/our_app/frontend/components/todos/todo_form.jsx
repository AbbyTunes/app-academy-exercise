import React from 'react';
import apiUtil from '../../util/apiUtil';

class TodoForm extends React.Component {
    constructor(props){   
        //=> props = receiveTodo (function)
        super(props);
        this.state = {
            title: '',
            body: ''
        };
        this.update = this.update.bind(this);
        this.handleSubmit = this.handleSubmit.bind(this);
    }

    update(field){
        return (event) => {
            this.setState({[field]: event.target.value});
        }
    }

    handleSubmit(event){
        event.preventDefault();
        
        const todo = Object.assign({}, this.state, {
            id: apiUtil.uniqueId()
        });

        this.props.receiveTodo(todo);
        this.setState({title: '', body: ''});
    }

    render(){
        return (
            <form>
                <label htmlFor="todo-title">Title</label>
                <input type="text" id="todo-title" value={this.state.title} onChange={this.update('title')}/>
                
                <label htmlFor="todo-body">Body</label>
                <input type="text" id="todo-body" value={this.state.body} onChange={this.update('body')} />
                
                <button onClick={this.handleSubmit}>Create To-do</button>
            </form>
        )
    }
}

export default TodoForm;