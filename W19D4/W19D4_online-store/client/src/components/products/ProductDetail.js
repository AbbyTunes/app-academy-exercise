import React from "react";
import { Query } from "react-apollo";
import Queries from "../../graphql/queries";
import AddToCart from "../cart/AddToCart";
const { FETCH_PRODUCT } = Queries;

class ProductDetail extends React.Component {
  render() {
    return (
      <Query 
        query={FETCH_PRODUCT}
        variables={{ _id: this.props.match.params.productId }}
      >
        {({ loading, error, data }) => {
          if (loading) return "Loading...";
          if (error) return `Error! ${error.message}`;
          const { name, description, weight, cost } = data.product;

          return (
            <div>
							<div>Name: {name}</div>
							<div>Description: {description}</div>
							<div>Weight: {weight}</div>
              <div>Cost: {cost}</div>
              <AddToCart product={data.product}/>
            </div>
          );
        }}
      </Query>
    )
  }
}

export default ProductDetail;