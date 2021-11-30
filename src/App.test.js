import { render, screen } from '@testing-library/react';
import App from './App';

test('Hello', () => {
  render(<App />);
  const linkElement = screen.getByText(/Hello again/i);
  expect(linkElement).toBeInTheDocument();
});
