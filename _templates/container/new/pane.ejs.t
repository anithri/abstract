---
to: app/javascript/panes/<%= name %>/index.js
---
import React from "react";
import PropTypes from "prop-types";
import cx from "classnames";
import styles from "./<%= name %>.module.css";

const <%= name %> = ({className}) => {
  return (
    <<%= elem || 'section' %> className={cx(className, styles.<%= name %>)}>
    </<%= elem || 'section' %>>
  );
};

<%= name %>.propTypes = {
  className: PropTypes.string
};

export default <%= name %>;
