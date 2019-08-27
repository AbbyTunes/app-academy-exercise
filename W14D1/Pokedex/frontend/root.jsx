import React from 'react';
import { Provider } from 'react-redux';
import PokemonIndexContainer from './components/pokemon/pokemon_index_container';
import { HashRouter, Route } from 'react-router-dom'
import PokemonDetailContainer from './components/pokemon/pokemon_detail_container';


const Root = ({ store }) => {
    return (
    <Provider store={store}>
        <HashRouter>
            <Route path="/pokemon/:pokemonId" component= { PokemonDetailContainer }/>
            <Route path="/" component={ PokemonIndexContainer } />
        </HashRouter>
    </Provider>
    )
}

export default Root;