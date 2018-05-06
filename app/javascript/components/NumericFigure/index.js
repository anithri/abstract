import React from "react";
import PropTypes from "prop-types";
import styles from "./numericFigure.module.css";

const NumericFigure = ({className, value, label}) => {
  console.log(className, value, label)
  return (
    <figure className={`${className} ${styles.numericFigure}`}>
      {value || 0}
      <figcaption>
        {label}
      </figcaption>
    </figure>
  );
};

NumericFigure.propTypes = {
  className: PropTypes.string,
  value: PropTypes.number,
  label: PropTypes.string.isRequired
};

export default NumericFigure;
