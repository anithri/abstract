import React from 'react';
import {gql} from 'apollo-boost';
import {Query} from 'react-apollo';
import Player from './Player';
import Draft from './Draft';
import Projects from './Projects';
import Messages from './Messages';

export const GET_PLAYERS = gql`
  query {
    players {
      id
      theme
      is_current
    }
  }
`;

const GameTable = ({players}) => {
  const allPlayers = players.map(player => (
    <Player key={`player${player.id}`} player_id={player.id} is_current={player.is_current} className={player.theme}/>
  ));
  return (
    <main>
      {allPlayers}
      <Draft className="draftArea"/>
      <Projects className="projectsArea"/>
      <Messages className="messagesArea"/>
    </main>
  );
};

const GameIndex = () => (
  <Query query={GET_PLAYERS}>
    {({loading, error, data}) => {
      if (loading) return <div>Loading...</div>;
      if (error) return <div>Error :(</div>;

      return <GameTable players={data.players}/>;
    }}
  </Query>
);

export default GameIndex;
