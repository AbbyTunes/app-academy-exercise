import React from "react";

class SessionForm extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            username: "",
            password: ""
		};
		this.handleSubmit = this.handleSubmit.bind(this);
	}
	
	handleInput(field) {
		return (e) => this.setState({
			[field]: e.target.value
		});
	}
    
    handleSubmit(e) {
        e.preventDefault();
        const user = Object.assign({}, this.state);
        this.props.processForm(user);
	}
	
	render() {

		return (
      <div>
        <form onSubmit={this.handleSubmit}>
			<br/>
          <label>
            Username:
            <input
              type="text"
              value={this.state.username}
              onChange={this.handleInput("username")}
            />
          </label>

			<br/>

          <label>
            Password:
            <input type="password"
				value={this.state.password}
				onChange={this.handleInput("password")}
				/>
          </label>

          <input type="submit" value={this.props.formType}/>
        </form>
      </div>
    );
	}
}

export default SessionForm;