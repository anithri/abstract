import PropTypes from 'prop-types'

export const workerShape = PropTypes.shape({
  id: PropTypes.string.isRequired,
  name: PropTypes.string.isRequired,
  theme: PropTypes.string.isRequired,
});

export const bagCountShape = PropTypes.shape({
  bar: PropTypes.integer,
  draw: PropTypes.integer,
  discard: PropTypes.integer,
  reserve: PropTypes.integer,
  projects: PropTypes.integer,
  dead: PropTypes.integer
})

export const bagShape = PropTypes.shape({
  id: PropTypes.string,
  name: PropTypes.string,
  workers: PropTypes.arrayOf(workerShape)
})

const all = {workerShape, bagCountShape, bagShape}

export default all;
