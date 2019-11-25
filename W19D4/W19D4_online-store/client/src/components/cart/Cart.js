import React from 'react';
import Queries from "../../graphql/queries";
import { Query } from "react-apollo";
import CartItem from "./CartItem";
const { FETCH_CART_ITEMS } = Queries;

class Cart extends React.Component {

  removeFromCart(client, cart, product) {
    cart = cart.filter(cartProduct => cartProduct._id !== product._id);
    client.writeData({ data: { cart } });
  }

  render() {
    return (
			<Query query={FETCH_CART_ITEMS}>
				{ ({ loading, error, data }) => {
					if (loading) return "Loading...";
					if (error) return `Error! ${error.message}`;
         
          if (!data || data.cart.length === 0 ) {
            return <div></div>
          } else {
              const { cart } = data;
            	const cartLis = cart.map((product, idx) => {
              return <CartItem product={product} cart={cart} key={idx} />
            })
            return (
              <div>
                <ul>
                  { cartLis }
                </ul>
                <p>Total Cost: {
                    cart.map(product => product.cost).reduce((total, num) => total + num)
                  }
                </p>
              </div>
            )
          }
				
				}}
			</Query>
    )
  }
};

export default Cart;