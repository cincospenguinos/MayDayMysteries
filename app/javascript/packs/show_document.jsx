import React from 'react'
import ReactDOM from 'react-dom'
import PropTypes from 'prop-types'
import Document from "./document/document";

function ShowDocument(props) {
  return (
    <div>
      <Document
        imageSource={props.info.name}
        datePublished={props.info.published}
      />
    </div>
  );
}

ShowDocument.propTypes = {
  info: PropTypes.shape({
    name: PropTypes.string,
    published: PropTypes.string,
  }).isRequired,
};

ShowDocument.defaultProps = {};

document.addEventListener('DOMContentLoaded', () => {
  const documentInfo = JSON.parse(document.getElementById('document-info').getAttribute('data-document-data'));

  ReactDOM.render(
    <ShowDocument info={documentInfo} />,
    document.body.appendChild(document.createElement('div')),
  );
})
