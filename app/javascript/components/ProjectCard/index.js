import React from 'react';
import styles from './ProjectCard.module.css';
import WorkerList from 'components/WorkerList';

const ProjectCard = ({name, workers}) => {

  return (
    <div className={styles.card}>
      <header>
        <h3>{name}</h3>
      </header>
      <WorkerList workers={workers}/>
    </div>
  )
}

export default ProjectCard;
