import React from 'react';
import { Link } from 'react-router-dom';
import PokemonDetail from './pokemon_detail';

class PokemonIndexItem extends React.Component {
    render() {
        return (
            <li className="pokemon-li">
                <Link to= "/pokemon/:pokemonId" component={PokemonDetail} />
                <h4>{this.props.pokemon.name}</h4>
                <img src={this.props.pokemon.image_url} /> 
            </li>
        );
    }
}

export default PokemonIndexItem;