import React, { Component } from "react";
import { Mutation } from "react-apollo";

import Mutations from "../../graphql/mutations";
const { NEW_ABODE } = Mutations;

import Queries from "../../graphql/queries";
const { FETCH_ABODES } = Queries;

class AbodeCreate extends Component {
	constructor(props) {
		super(props);
		this.state = {
			name: "",
			coordinates: ""
		}
		this.handleSubmit = this.handleSubmit.bind(this);
	}

	handleChange(field) {
		return e => this.setState({ [field]: e.target.value });
	}

	handleSubmit(e, newAbode) {
		e.preventDefault();
		let name = this.state.name;
		let coordinates = this.state.coordinates;

		newAbode({
			variables: {
				name,
				coordinates
			}
		})
			.then(data => {
				console.log(data);
				this.setState({
					message: `New abode "${name}" created successfully`,
					name: ""
				});
			})
	}

	updateCache(cache, { data: { newAbode } }) {
		let abodes;

		try {
			abodes = cache.readQuery({ query: FETCH_ABODES });
		} catch (err) {
			return;
		}

		if (abodes) {
			let abodeArray = abodes.abodes;

			cache.writeQuery({
				query: FETCH_ABODES,
				data: { abodes: abodeArray.concat(newAbode) }
			});
		}
	}

	render() {
		return (
			<Mutation mutation={NEW_ABODE}
				update={(cache, data) => this.updateCache(cache, data)} >
				{(newAbode, { data }) => (
					<div>
						<form onSubmit={e => this.handleSubmit(e, newAbode)}>

							<input onChange={this.handleChange('name')}
								placeholder='name'
								value={this.state.name} />

							<input onChange={this.handleChange('coordinates')}
								placeholder='coordinates'
								value={this.state.coordinates} />

							<button type='submit'>Create!</button>
						</form>
						
						<p>{this.state.message}</p>
					</div>

				)}
			</Mutation>
		);
	}
}

export default AbodeCreate;