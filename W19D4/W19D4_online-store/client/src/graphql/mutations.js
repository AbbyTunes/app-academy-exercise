import gql from "graphql-tag";

export default {
  LOGIN_USER: gql`
    mutation LoginUser($email: String!, $password: String!) {
      login(email: $email, password: $password) {
        token
        loggedIn
      }
    }
  `,
  SIGNUP_USER: gql`
    mutation SignupUser($name: String!, $email: String!, $password: String!) {
      register(name: $name, email: $email, password: $password) {
        token
        loggedIn
      }
    }
  `,
  VERIFY_USER: gql`
    mutation VerifyUser($token: String!) {
      verifyUser(token: $token) {
        loggedIn
      }
    }
  `,

  CREATE_PRODUCT: gql`
    mutation CreateProduct($name: String!, $weight: Float!, $description: String!) {
      newProduct(name: $name, weight: $weight, description: $description) {
        _id
        name
        weight
        description
    }
}
  `
};
