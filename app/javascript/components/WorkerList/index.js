import React from "react";
import PropTypes from "prop-types";
import styles from "./WorkerList.module.css";
import {workerShape} from 'shapes'

const WorkerList = ({workers}) => {
  const items = workers.map((worker, idx) => (
    <li key={`${worker.id}${idx}`} className={worker.theme}>♙</li>
  ));

  return (
    <ul className={styles.workerList}>
      {items}
    </ul>
  );
};

WorkerList.propTypes = {
  workers: PropTypes.arrayOf(workerShape).isRequired
};

export default WorkerList;
