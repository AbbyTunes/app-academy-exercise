import React from "react";
import { Link } from 'react-router-dom';


const Greeting = ({ currentUser, logout}) => {

    const sessionLinks = () => (
      <nav>
        <Link to="/login">Login</Link>
        <br />
        <Link to="/signup">Sign up</Link>
      </nav>
    );
    // where the route from? 
    // defined by rails routes or by the frontend customized Routes

    const personalGreeting = () => (
      <hgroup>
        <h3>Hi, {currentUser.username}</h3>
        <button onClick={logout}>Log Out</button>
      </hgroup>
    );

    return currentUser ? personalGreeting() : sessionLinks();
};

export default Greeting;
