import React, { useState } from "react";
import { Query } from "react-apollo";
import { Link } from "react-router-dom";



// godId, relativeId, relationship
class RelativesDetails extends React.Component {

	constructor(props) {
		super(props)
		this.state = {
			relativeType: "parents"
		}
		this.changeRelationship = this.changeRelationship.bind(this);
	}

	changeRelationship(e) {
    e.preventDefault()
		this.setState({relativeType: e.target.value})
	}

	render() {
		return (
			<div className="styled-select slate">
				<select onChange={this.changeRelationship}>
					<option value="parents">parents</option>
					<option value="children">children</option>
					<option value="siblings">siblings</option>
				</select>
				<h4>{this.state.relativeType}</h4>
        <ul>
          {this.props.god[this.state.relativeType].map((relative, idx) => {
            return <li key={idx}>
			  {relative.name}
			  {relative.abode}
            </li>
          })}
        </ul>
			</div>
		);
	}

}

export default RelativesDetails;