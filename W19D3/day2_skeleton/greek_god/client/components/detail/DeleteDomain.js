import React from 'react';
import { Mutation } from "react-apollo";

import Mutations from "../../graphql/mutations";
const { DELETE_GOD_DOMAIN } = Mutations;

const linkStyle = {
  cursor: "pointer",
  fontSize: "10px",
  color: "red"
};

const DeleteDomain = props => {
  return (
    <Mutation mutation={DELETE_GOD_DOMAIN}>
      {(removeGodDomain, data) => (
        <a style={linkStyle}
          onClick={e => {
            e.preventDefault();
            removeGodDomain({ variables: { godId: props.godId, domain: props.domain } });
          }} >
          <p>Delete</p>
        </a>
      )}
    </Mutation>
  );
};

export default DeleteDomain;