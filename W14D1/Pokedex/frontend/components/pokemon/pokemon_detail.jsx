import React from 'react';
import { requestSinglePokemon } from '../../actions/pokemon_actions';


class PokemonDetail extends React.Component {

    constructor(props) {
        super(props)
    }
    
    componentDidMount() {
        const id = this.props.match.params.pokemonId;
        this.props.requestSinglePokemon(id);
    }

    render() {
        const items = this.props.pokemon.items.map(item => <li>{item}</li>)
        return (
          <li>
            <h2>{ this.props.pokemon.name}</h2>
            <img src={ this.props.pokemon.image_url}/>
            <span>{this.props.pokemon.attack}</span>
            <span>{ this.props.pokemon.defense }</span>
            <span>{this.props.pokemon.poke_type}</span>
            <span>{this.props.pokemon.moves.join(" ")}</span>
            <ul>
                {items}        
            </ul>
          </li>
        )

    }

}


export default PokemonDetail;