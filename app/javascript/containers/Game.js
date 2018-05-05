import React from 'react';
import {gql} from 'apollo-boost';
import {Query} from 'react-apollo';
import Player from './Player';
import DraftArea from './DraftArea';
import Projects from './Projects';
import Messages from './Messages';

const GET_PLAYERS = gql`
  query {
    players {
      id
      theme
    }
  }
`;

const GameTable = ({players}) => {
  return (
    <main>
      <Player playerId={1} className='playerOne'/>
      <Player playerId={2} className='playerTwo'/>
      <Player playerId={3} className='playerThree'/>
      <Player playerId={4} className='playerFour'/>
      <DraftArea/>
      <Projects/>
      <Messages/>
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
