import { connect } from 'react-redux';
import { selectAllPokemon, selectAllItems } from '../../reducers/selectors';
import { requestSinglePokemon } from '../../actions/pokemon_actions';
import PokemonDetail from './pokemon_detail'

const mapStateToProps = (state, ownProps) => {
    const pokemonId = ownProps.match.params.pokemonid; 
    const allitems = selectAllItems(state);
    let pokemon = state.entities.pokemon[pokemonId];
    let itemIds = pokemon.item_ids
    const pokemonItems = itemIds.map(id => allitems[id])

    pokemon = Object.assign({}, pokemon, { items: pokemonItems })

    return {pokemon: pokemon}

};

const mapDispatchToProps = (dispatch, ownProps) => ({
    requestSinglePokemon: (id) => dispatch(requestSinglePokemon(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(PokemonDetail);