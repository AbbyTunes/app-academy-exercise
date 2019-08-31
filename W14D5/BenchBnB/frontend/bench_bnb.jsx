import React from "react";
import ReactDOM from "react-dom";
import configureStore from './store/store';
import Root from './components/root';
import { fetchBenches } from './actions/bench_actions';

let store = configureStore();
window.dispatch = store.dispatch;
window.getState = store.dispatch;
window.fetchBenches = fetchBenches;

document.addEventListener("DOMContentLoaded", () => {
    let store;
    if (window.currentUser) {
        const preloadedState = {
            entities: {
                users: { [window.currentUser.id]: window.currentUser }
            },
            session: { id: window.currentUser.id }
        };
        store = configureStore(preloadedState);
        delete window.currentUser;
    } else {
        store = configureStore();
    }

    const root = document.getElementById("root");
    ReactDOM.render(<Root store={store} />, root);
});



// window.getState = store.getState;
// window.dispatch = store.dispatch;
// window.store = store;

// window.signup = signup;
// window.login = login;
// window.logout = logout;

// {user: { username: "abby", password: "123456"}}
