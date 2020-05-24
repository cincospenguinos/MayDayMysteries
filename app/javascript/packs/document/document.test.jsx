import React from 'react';
import { render, cleanup } from '@testing-library/react';
import Document from "./document";

describe('app/javascript/packs/document/document', () => {
  const renderComponent = (props = {}) => render(<Document {...props} />);

  afterEach(cleanup);

  it('shows an image with the source provided', () => {
    const { getByRole } = renderComponent({ imageSource: '81-may-1.jpg' });
    expect(getByRole('img').getAttribute('src')).toEqual('/assets/documents/81-may-1.jpg');
  });
});