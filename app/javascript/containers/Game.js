import React from 'react';
import { gql } from 'apollo-boost';
import { Query } from 'react-apollo';

const GET_PLAYERS = gql`
  query {
    players {
      id
      name
    }
  }
`;

const GameTable = ({ players }) => {
  return (
    <table>
      <tbody>
      {players.map(({ id, name}) => (
        <tr key={id}>
          <td>{id}</td>
          <td>{name}</td>
        </tr>
      ))}
      </tbody>
    </table>
  );
};

const GameIndex = () => (
  <Query query={GET_PLAYERS}>
    {({ loading, error, data }) => {
      if (loading) return <div>Loading...</div>;
      if (error) return <div>Error :(</div>;

      return <GameTable players={data.players} />;
    }}
  </Query>
);

export default GameIndex;
