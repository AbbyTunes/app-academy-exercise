import React, { Component } from "react";
import { Mutation } from "react-apollo";

import Mutations from "../../graphql/mutations";
const { NEW_GOD } = Mutations;

class GodCreate extends Component {
  constructor(props) {
    super(props);
    this.state = {
      name: "",
      type: "god",
      description: ""
    }

    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(field) {
    return e => this.setState({[field]: e.target.value});
  }

  handleSubmit(e, newGod) {
    e.preventDefault();
    let name = this.state.name;

    newGod({
      variables: {
        name: name,
        type: this.state.type,
        description: this.state.description
      }
    })
      .then(data => {
        console.log(data);
        this.setState({
          message: `New deity "${name}" created successfully`,
          name: "",
          type: "god",
          description: ""
        });
      })
  }

  updateCache(cache, { data: { newGod } }) {
    let gods;

    try {
      gods = cache.readQuery({ query: FETCH_GODS });
    } catch (err) {
      return;
    }

    if (gods) {
      let godArray = gods.gods;

      cache.writeQuery({
        query: FETCH_GODS,
        data: { gods: godArray.concat(newGod) }
      });
    }
  }

  render() {
    return (
      <Mutation mutation={NEW_GOD}
        update={(cache, data) => this.updateCache(cache, data)} >
        {(newGod, {data}) => (
			<div>
				<form onSubmit={e => this.handleSubmit(e, newGod)}>

					<input onChange={this.handleChange('name')}
							placeholder='name'
							value={this.state.name} />

					<select onChange={this.handleChange('type')}>
						<option value="god">God</option>
						<option value="goddess">Goddess</option>
					</select>

					<textarea onChange={this.handleChange('description')}
							placeholder='description'
							value={this.state.description}/>

					<button type='submit'>Create!</button>
				</form>
				<p>{this.state.message}</p>
			</div>
          
        )}
      </Mutation>
    );
  }
}

export default GodCreate;