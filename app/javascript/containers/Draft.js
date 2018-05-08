import React from 'react';
import { gql } from 'apollo-boost';
import { Query } from 'react-apollo';
import DraftingPane from 'panes/Drafting'

const Draft = ({className}) => {
  const GET_DRAFTING = gql`
    query {
      bag_counts {
        bar
        draw
        discard
        reserve
        projects
        dead
       }

      bag_by_name(name: "bar") {
        workers {
          id
          name
          theme
        }
      }
    }
  `
  return (
    <Query query={GET_DRAFTING} pollInterval={0}>
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
        return <DraftingPane {...data} className={className}/>;
      }}
    </Query>
  )
}

export default Draft;
