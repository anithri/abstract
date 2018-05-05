import React from 'react';
import { gql } from 'apollo-boost';
import { Query } from 'react-apollo';

const Player = ({player}) => {
  const {theme, name} = player
  return (
    <div className={theme}>{name}</div>
  )
}

const PlayerContainer = ({playerId}) => {
  const GET_PLAYER = gql`
  query {
    player(id: ${playerId}) {
      theme
      name
    }
  }
`;
  return (
    <Query query={GET_PLAYER} variables={{id: playerId}} pollInterval={1000}>
      {({ loading, error, data }) => {
        if (loading) return <div>Loading...</div>;
        if (error) return <div>Error :(</div>;

        return <Player player={data.player}/>;
      }}
    </Query>
  )
}

export default PlayerContainer;
