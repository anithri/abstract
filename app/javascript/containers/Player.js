import React from 'react';
import { gql } from 'apollo-boost';
import { Query } from 'react-apollo';
import PlayerArea from '../components/PlayerArea'

const PlayerContainer = ({playerId, className}) => {
  const GET_PLAYER = gql`
    query {
      player(id: ${playerId}) {
        name
        score
        workers {
          id
          name
          theme
        }
      }
    }
  `;

  return (
    <Query query={GET_PLAYER} variables={{id: playerId}} pollInterval={0}>
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
        const player = data.player
        return <PlayerArea {...player} className={className}/>;
      }}
    </Query>
  )
}

export default PlayerContainer;
