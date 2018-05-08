import React from "react";
import { gql } from "apollo-boost";
import { Mutation } from "react-apollo";
import { GET_PLAYERS } from "containers/Game";

const FinishPlayerTurn = ({ game_id, player_id, className }) => {

  const FINISH_TURN = gql`
    mutation finishPlayerTurn($game_id: ID!) {
      finishPlayerTurn(input:{game_id: $game_id}) {
        players{
          score
          is_current
        }
      }
    }
  `;

  const myUpdate = (cache, { data: { finishPlayerTurn } }) => {
    cache.writeQuery({
      query: GET_PLAYERS,
      data: { players: finishPlayerTurn.players }
    });
  };

  return (
    <Mutation mutation={FINISH_TURN} update={myUpdate}>
      {(finishTurn, { data }) => {
        const myClick = e => {
          console.log("clicked");
          e.preventDefault();
          finishTurn({ variables: { game_id: 1 } });
        };

        return (
          <button className={className} onClick={myClick}>
            Finish Turn
          </button>
        );
      }}
    </Mutation>
  );
};

export default FinishPlayerTurn;
