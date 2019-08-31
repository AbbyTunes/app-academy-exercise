import React from 'react';

class BenchIndexItem extends React.Component {
    constructor(props) {
        super(props);
    }

	render() {
		return (
            <li key={this.props.bench.id}>
				Description: {this.props.bench.description}
                Lattitude: "{this.props.bench.lat}"
                longitude: "{this.props.bench.lng}"
            </li>
        )
	}
}

export default BenchIndexItem;