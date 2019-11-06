import React, { Component } from "react";
import { Query } from "react-apollo";

import NameDetail from "../detail/NameDetail";
import TypeDetail from "../detail/TypeDetail";
import DescriptionDetail from "../detail/DescriptionDetail";
import DomainsDetail from "../detail/DomainsDetail";
import RelativesDetail from "../detail/RelativesDetail";
import Queries from "../../graphql/queries";

const { FETCH_GOD } = Queries;

const GodDetail = props => {
  return (
    <Query query={FETCH_GOD} variables={{ id: props.match.params.id }}>
      { ({ loading, error, data }) => {
        if (loading) return <p>Loading...</p>
        if (error) return <p>Error</p>

        return <div className="detail">
			<NameDetail god={data.god} />
			<TypeDetail god={data.god} />
			<DescriptionDetail god={data.god} />
			<DomainsDetail god={data.god} />
			<RelativesDetail god={data.god} />
        </div>
      }}
    </Query>
  )
}

export default GodDetail;