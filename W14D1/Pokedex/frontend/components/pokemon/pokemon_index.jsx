import React from 'react';
import PokemonIndexItem from './pokemon_index_item';

class PokemonIndex extends React.Component {
    constructor(props) {
        super(props)
    }

    componentDidMount() {
        this.props.requestAllPokemon();
    }

    render() {

        const pokemons = this.props.pokemons;
        const allPokemons = pokemons.map(pokemon =>   
            <PokemonIndexItem key={pokemon.id} pokemon={pokemon} />)

        return (
            <section className= "pokedex">
                <ul>
                    {allPokemons}
                </ul>
            </section>
        )
    }
}

export default PokemonIndex;