import React from "react";
import { Mutation, Query } from "react-apollo";
import { IconContext } from "react-icons";
import { FaPencilAlt } from "react-icons/fa";

import Mutations from "../../graphql/mutations";
const { ADD_GOD_DOMAIN } = Mutations;

class AddDomain extends React.Component {

	constructor(props) {
		super(props);
		this.state = {
			editing: false,
			domain: ""
		};
		this.handleSubmit = this.handleSubmit.bind(this);
		this.handleEdit = this.handleEdit.bind(this);
	}
	
	handleEdit() {
		this.setState({editing: true})
	};
  
	handleSubmit(e, addGodDomain) {
		e.preventDefault();
		addGodDomain({
			variables: { godId: this.props.godId, domain: this.state.domain }
		}).then(() => {
      this.setState({ editing: false });
      this.setState({ domain: "" });
    });
	}
	
	fieldUpdate() {
		return (e) => {
			this.setState({domain: e.target.value})
		}
	}

	render() {

		if (this.state.editing) {
			return (<Mutation mutation={ADD_GOD_DOMAIN}>
				{(addGodDomain) => (
					<div>
						<form onSubmit={e => this.handleSubmit(e, addGodDomain)} >
							<input value={this.state.domain}
								onChange={this.fieldUpdate()} />
							<button type="submit">Add Domain</button>
						</form>
					</div>
				)}
			</Mutation>)
		} else {
			return (
				<div>
					<div onClick={this.handleEdit}
						style={{ fontSize: "10px", cursor: "pointer", display: "inline" }} >
						<IconContext.Provider value={{ className: "custom-icon" }}>
							<FaPencilAlt />
						</IconContext.Provider>
					</div>
					<h2>Add Domain</h2>
				</div>
			);
		}
	}
}

export default AddDomain;