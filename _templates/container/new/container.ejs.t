---
to: app/javascript/containers/<%= name %>.js
---
import React from "react";
import { gql } from "apollo-boost";
import { Query } from "react-apollo";
import <%= name %>Pane from "panes/<%= name %>"'

const <%= name %> = ({className}) => {

export default <%= name %>;
  const GET_<%= h.inflections.underscore(name).toUpperCase() %> = gql`
    query {
    }
  `
  return (
    <Query query={GET_<%= h.inflections.underscore(name).toUpperCase() %>} pollInterval={0}>
      {({ loading, error, data }) => {
        if (loading) return (
          <div className={`boxCenter ${className}`}>
            <span>Loading...</span>
          </div>
        );
        if (error) return (
          <div className={`boxCenter ${className}`}>
            <span>error :(</span>
          </div>
        );
        return <<%= name %>Pane {...data} className={className}/>;
      }}
    </Query>
  )
}

<%= name %>.propTypes = {
  className: PropTypes.string
};

export default <%= name %>;
