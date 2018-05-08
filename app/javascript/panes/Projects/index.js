import React from "react";
import cx from "classnames";
import styles from "./ProjectsPane.module.css";
import ProjectCard from "components/ProjectCard";

const ProjectsPane = ({ projects, game, className }) => {
  const cards = projects.map((project, idx) => (
    <ProjectCard key={`projectCard${idx + 1}`} {...(project.cards[0])} />
  ));

  return (
    <section className={cx(className, styles.pane, styles[game.bar_side])}>
      {cards}
    </section>
  );
};


export default ProjectsPane;
