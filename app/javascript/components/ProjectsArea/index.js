import React from 'react';
import styles from './ProjectsArea.module.css';
import ProjectCard from 'components/ProjectCard';

const ProjectsArea = ({projects, game, className }) => {
  const cards = projects.map((project, idx)=> (
    <ProjectCard key={`projectCard${idx+1}`} {...(project.cards[0])} />
  ));

  return (
    <section className={`${className} ${styles.area} ${styles[game.bar_side]}`}>
      {cards}
    </section>
  )
}


export default ProjectsArea;
