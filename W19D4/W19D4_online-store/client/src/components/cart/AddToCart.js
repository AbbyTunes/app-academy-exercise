import React from 'react';
import { Query } from "react-apollo";
import Queries from "../../graphql/queries";
import { ApolloConsumer } from "react-apollo";
const { FETCH_CART_ITEMS } = Queries;

class AddToCart extends React.Component {

  addToCart(client, cart) {
    client.writeData({ 
			data: { 
				cart: cart.concat([{ 
					__typename: "ProductType", 
					_id: this.props.product._id, 
					cost: this.props.product.cost
				}]) 
			} 
		});
  }

  removeFromCart(client, cart) {
    cart = cart.filter(product => product._id !== this.props.product._id);
    client.writeData({ data: { cart } });
  }

	render() {
		return (
		<ApolloConsumer>
			{client => (
			
				<Query query={FETCH_CART_ITEMS}>
				{({ loading, error, data }) => {
					if (loading) return "Loading...";
					if (error) return `Error! ${error.message}`;
          const { cart } = data;
					if (cart.map(item => item._id).includes(this.props.product._id)) {
						return <button onClick={() => this.removeFromCart(client, cart)}>Remove from Cart</button>
					} else {
						return <button onClick={() => this.addToCart(client, cart)}>Add To Cart</button>
					}
				}}
			</Query>
			)}
		</ApolloConsumer>
	)}

};

export default AddToCart;