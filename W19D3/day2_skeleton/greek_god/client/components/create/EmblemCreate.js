import React, { Component } from "react";
import { Mutation } from "react-apollo";

import Mutations from "../../graphql/mutations";
const { NEW_EMBLEM } = Mutations;

import Queries from "../../graphql/queries";
const { FETCH_EMBLEMS } = Queries;

class EmblemCreate extends Component {
	constructor(props) {
		super(props);
		this.state = {
			name: ""
		}
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	handleChange(field) {
		return e => this.setState({ [field]: e.target.value });
	}

	handleSubmit(e, newEmblem) {
		e.preventDefault();
		let name = this.state.name;

		newEmblem({
				variables: { name: name }
			})
			.then(data => {
				console.log(data);
				this.setState({
					message: `New emblem "${name}" created successfully`,
					name: ""
				});
			})
	}

	updateCache(cache, { data: { newEmblem } }) {
		let emblems;

		try {
			emblems = cache.readQuery({ query: FETCH_EMBLEMS });
		} catch (err) {
			return;
    }
    
		if (emblems) {
			let emblemArray = emblems.emblems;

			cache.writeQuery({
				query: FETCH_EMBLEMS,
				data: { emblems: emblemArray.concat(newEmblem) }
			});
		}
	}

	render() {
		return (
			<Mutation mutation={NEW_EMBLEM}
				update={(cache, data) => this.updateCache(cache, data)} >
				{(newEmblem, { data }) => (
					<div>
						<form onSubmit={e => this.handleSubmit(e, newEmblem)}>

							<input onChange={this.handleChange('name')}
								placeholder='name'
								value={this.state.name} />
							<button type='submit'>Create!</button>
						</form>
						<p>{this.state.message}</p>
					</div>

				)}
			</Mutation>
		);
	}
}

export default EmblemCreate;