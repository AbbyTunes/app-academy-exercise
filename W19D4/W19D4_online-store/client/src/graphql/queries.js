
import gql from "graphql-tag";

export default {

  FETCH_PRODUCTS: gql`
    query products {
      products {
        _id
        name
      }
    }
  `,
  FETCH_PRODUCT: gql`
    query product($_id: ID!) {
      product(_id: $_id) {
        _id
        name
        description
        weight
        cost
      }
    }
  `,
  IS_LOGGED_IN: gql`
    query IsUserLoggedIn {
      isLoggedIn @client
    }
  `,
  FETCH_CART_ITEMS: gql`
    query FetchCartItems {
      cart @client {
        _id
        cost
      }
    }
  `
};