import React from 'react';
import PropTypes from 'prop-types';

export default function Document(props) {
  const imgSrc = `/assets/documents/${props.imageSource}`;

  return (<div>
    <img
      alt={props.imageSource}
      src={imgSrc}
    />
  </div>);
}

Document.propTypes = {
  imageSource: PropTypes.string.isRequired,
};

Document.defaultProps = {};
