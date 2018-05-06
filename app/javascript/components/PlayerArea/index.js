import React from 'react';
import PropTypes from 'prop-types';
import styles from './PlayerArea.module.css';
import WorkerList from 'components/WorkerList';
import {workerShape} from 'shapes';

const PlayerArea = ({name, score, className, workers}) => {
  return (
    <section className={`${className} ${styles.playerArea}`}>
      <header>
        <h3 className="name">{name}</h3>
        <h3>{score}</h3>
        <WorkerList workers={workers}/>
      </header>
      <section>Deck Size: 0</section>
    </section>
  )
}

PlayerArea.propTypes = {
  name: PropTypes.string.isRequired,
  score: PropTypes.number.isRequired,
  className: PropTypes.string.isRequired,
  workers: PropTypes.arrayOf(workerShape).isRequired
}

export default PlayerArea

