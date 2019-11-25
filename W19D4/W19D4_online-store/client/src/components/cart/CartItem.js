import React from 'react';
import Queries from "../../graphql/queries";
import { ApolloConsumer, Query } from "react-apollo";
const { FETCH_PRODUCT } = Queries;

class CartItem extends React.Component {
	removeFromCart(client, cart) {
    cart = cart.filter(product => product._id !== this.props.product._id);
    client.writeData({ data: { cart } });
	}

	render() {
		return (
			<ApolloConsumer>
				{client => (
          <Query 
            query={FETCH_PRODUCT}
            variables={{ _id: this.props.product._id }} >

            {({ loading, error, data }) => {
              if (loading) return "Loading...";
              if (error) return `Error! ${error.message}`;

							const cart = this.props.cart;
							const { name, cost, weight, description } = data.product;

							return (
								<div>
									<div>Name: {name}</div>
									<div>Description: {description}</div>
									<div>Weight: {weight}</div>
									<div>Cost: {cost}</div>
									<button onClick={() => this.removeFromCart(client, cart)}>Remove from Cart</button>
								</div>
							)
						}}
					</Query>
				)}
			</ApolloConsumer>
		)
	}
}

export default CartItem;