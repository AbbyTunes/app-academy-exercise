import React from "react";
import { Mutation } from "react-apollo";
import { IconContext } from "react-icons";
import { FaPencilAlt } from "react-icons/fa";

import Mutations from "../../graphql/mutations";
const { UPDATE_GOD_TYPE } = Mutations;

class TypeDetail extends React.Component {

  constructor(props) {
    super(props);
    this.state = {
      type: this.props.god.type || ""
    };
    this.handleChange = this.handleChange.bind(this);
  }

	handleChange(e, updateGod) {
		this.setState({type: e.target.value}, () => {
			updateGod({
				variables: { id: this.props.god.id, type: this.state.type }
			})
		})
	}

  render() {
    return (
      <Mutation mutation={UPDATE_GOD_TYPE}>
        {(updateGod, data) => (
			<div>
				
        <select defaultValue={this.state.type}
          onChange={e => this.handleChange(e, updateGod)}>
					<option value="god" >God</option>
					<option value="goddess" >Goddess</option>
				</select>
			</div>
        )}
      </Mutation>
    );
  }
}

export default TypeDetail;