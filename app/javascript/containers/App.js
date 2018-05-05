import React from 'react';
import ApolloClient from 'apollo-boost';
import {ApolloProvider} from 'react-apollo';
import Game from 'containers/Game';

const client = new ApolloClient({uri: 'http://localhost:3000/graphql'});

const App = () => (
  <ApolloProvider client={client}>
    <Game/>
  </ApolloProvider>
);

export default App;
