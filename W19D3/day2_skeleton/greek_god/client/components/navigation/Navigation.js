import React, { Component } from "react";
import { NavLink } from "react-router-dom";

class Nav extends Component {
	
	constructor(props) {
		super(props)
	}

	render() {
		return (
			<div className="nav-bar">
				<ul>
					<li>
						<NavLink to="/">Home</NavLink>
					</li>
					<li>
						<NavLink to="/new">New</NavLink>
					</li>
				</ul>
			</div>
			);
	}
}

export default Nav;