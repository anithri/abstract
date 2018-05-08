---
to: app/javascript/components/<%= name %>/index.js
---
import React from "react";
import PropTypes from "prop-types";
import cx from "classnames";
import styles from "./<%= name %>.module.css";

const <%= name %> = ({className}) => {
  return (
    <<%= elem || 'div' %> className={cx(className, styles.<%= name %>)}>
    </<%= elem || 'div' %>>
  );
};

<%= name %>.propTypes = {
  className: PropTypes.string
};

export default <%= name %>;
