import React from 'react';
import { render, cleanup } from '@testing-library/react';
import moment from 'moment';
import Document from "./document";

describe('app/javascript/packs/show_document/document', () => {
  const renderComponent = (props = {}) => render(<Document {...props} />);

  afterEach(cleanup);

  it('shows an image with the source provided', () => {
    const { getByRole } = renderComponent({ imageSource: '81-may-1.jpg' });
    expect(getByRole('img').getAttribute('src')).toEqual('/assets/documents/81-may-1.jpg');
  });

  it('displays the publishing date of the document', () => {
    const { getByText } = renderComponent({ imageSource: 'foo.jpg', datePublished: '1981-05-01' });
    expect(getByText('Published 1981 May 01')).toBeTruthy();
  });

  it('does not show publishing date when it is not included', () => {
    const { queryByText } = renderComponent({ imageSource: 'bar.jpg' });
    const wrongPublishingDate = moment().format('YYYY MMM DD');
    expect(queryByText(`Published ${wrongPublishingDate}`)).not.toBeTruthy();
  });
});