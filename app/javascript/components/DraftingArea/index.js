import React from 'react';
import PropTypes from 'prop-types';
import {bagCountShape, bagShape} from 'shapes'
import styles from './DraftingArea.module.css'
import NumericFigure from '../NumericFigure'
import WorkerList from 'components/WorkerList';

const DraftArea = ({bag_by_name, bag_counts, className}) => {
  console.log(bag_counts['draw'])
  const figures = Object.keys(bag_counts).map((name, idx) => {
      if (name === '__typename') return;
      return (
        <NumericFigure key={`bag${idx}`}
                       className={styles[name]}
                       value={bag_counts[name]}
                       label={name}
        />
      )
    }
  )

  return (
    <section className={`${className} ${styles.area}`}>
      <section className={styles.details}>
        <WorkerList workers={bag_by_name.workers}/>
      </section>
      {figures}
    </section>
  )
}

DraftArea.propTypes = {
  bag_count: bagCountShape,
  bag_by_name: bagShape,
  className: PropTypes.string
}

export default DraftArea;
