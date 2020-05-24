import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'

const ShowDocument = props => (
  <div>A document should appear here!</div>
);

ShowDocument.defaultProps = {
  name: 'David'
};

ShowDocument.propTypes = {
  name: PropTypes.string
};

document.addEventListener('DOMContentLoaded', (props) => {
  // TODO: props is { name, published }. May need to extract it from JSON or something
  ReactDOM.render(
    <ShowDocument />,
    document.body.appendChild(document.createElement('div')),
  );
})
