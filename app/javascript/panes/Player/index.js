import cx from "classnames";
import React from "react";
import PropTypes from "prop-types";
import styles from "./PlayerPane.module.css";
import WorkerList from "components/WorkerList";
import { workerShape } from "shapes";

const PlayerPane = ({ name, score, className, workers, is_current }) => {
  return (
    <section className={cx(className, styles.pane, { [styles.current]: is_current })}>
      <header>
        <h3 className="name">{name}</h3>
        <h3>{score}</h3>
        <WorkerList workers={workers}/>
      </header>
      <section>Deck Size: 0</section>
    </section>
  );
};

PlayerPane.propTypes = {
  name: PropTypes.string.isRequired,
  score: PropTypes.number.isRequired,
  className: PropTypes.string.isRequired,
  workers: PropTypes.arrayOf(workerShape).isRequired
};

export default PlayerPane;

