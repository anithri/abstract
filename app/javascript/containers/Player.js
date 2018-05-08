import React from "react";
import { gql } from "apollo-boost";
import { Query } from "react-apollo";
import PlayerPane from "../panes/Player";

export const GET_PLAYER = gql`
    query player($player_id: ID!) {
      player(player_id: $player_id) {
        name
        workers {
          id
          name
          theme
        }
      }
    }
  `;

const PlayerContainer = ({ player_id, is_current, score, className }) => {
  return (
    <Query query={GET_PLAYER} variables={{ player_id }} pollInterval={0}>
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
        const player = data.player;
        return <PlayerPane {...player} score={score} is_current={is_current} className={className}/>;
      }}
    </Query>
  );
};

export default PlayerContainer;
