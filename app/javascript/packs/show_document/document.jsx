import React from 'react';
import PropTypes from 'prop-types';
import moment from 'moment';

export default function Document(props) {
  const imgSrc = `/assets/documents/${props.imageSource}`;
  const publishingDate = moment(props.datePublished).format('YYYY MMM DD');

  return (<div>
    { props.datePublished && <h4>Published {publishingDate}</h4> }
    <img
      alt={props.imageSource}
      src={imgSrc}
    />
  </div>);
}

Document.propTypes = {
  imageSource: PropTypes.string.isRequired,
  datePublished: PropTypes.string,
};

Document.defaultProps = {
  datePublished: undefined,
};
