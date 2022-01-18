import React from 'react';
import ReactDOM from 'react-dom';
import { BrowserRouter as Router} from "react-router-dom";
import {ChakraProvider, extendTheme} from "@chakra-ui/react";
import { createBreakpoints } from '@chakra-ui/theme-tools'
import './index.css';
import App from './App';
import reportWebVitals from './reportWebVitals';

const breakpoints = createBreakpoints({
    sm: '30em',
    md: '48em',
    lg: '62em',
    xl: '80em',
    '2xl': '96em',
})
const theme = extendTheme({ breakpoints })
ReactDOM.render(
  <React.StrictMode>
      <ChakraProvider theme={theme}>
          <Router>
              <App />
          </Router>
      </ChakraProvider>
  </React.StrictMode>,
  document.getElementById('root')
);

// If you want to start measuring performance in your app, pass a function
// to log results (for example: reportWebVitals(console.log))
// or send to an analytics endpoint. Learn more: https://bit.ly/CRA-vitals
reportWebVitals();
