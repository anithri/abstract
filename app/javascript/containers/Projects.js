import React from 'react';
import { gql } from 'apollo-boost';
import { Query } from 'react-apollo';
import ProjectsArea from 'components/ProjectsArea';

const Projects = ({className}) => {
  const GET_PROJECTS = gql`
    query {
      game {
        bar_side
       }

      projects {
        cards {
          name
          id
          workers {
            name
            id
            theme
          }
        }
      }
    }
  `

  return (
    <Query query={GET_PROJECTS} pollInterval={0}>
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
        return <ProjectsArea {...data} className={className}/>;
      }}
    </Query>
  )
}

export default Projects;
