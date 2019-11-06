import React from "react";
import { Query } from "react-apollo";
import { Link } from "react-router-dom";
import AddDomain from "./AddDomain";
import DeleteDomain from "./DeleteDomain";

const DomainsDetail = props => {
  return ( <div className="outer">
    <ul>
      {props.god.domains ?
        props.god.domains.map((domain, idx) => (
        <li key={idx}>
          {domain}
          <DeleteDomain godId={props.god.id} domain={domain} />
        </li>))
        : "No domains"
      }
      <AddDomain godId={props.god.id} />  
    </ul>
  </div> )
};

export default DomainsDetail;
