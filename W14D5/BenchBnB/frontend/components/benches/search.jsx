import React from 'react';
import BenchMap from './bench_map';
import BenchIndex from './bench_index';

const Search = ({ benches, fetchBenches }) => (
  <div>
    <h2>We are at Bench_Search</h2>
    <BenchMap benches={benches} />
    <BenchIndex benches={benches} fetchBenches={fetchBenches} />
  </div>
);

export default Search;

// class Search extends React.Component {

// 	// render() {
// 	// 	return (
// 			<div>
// 				<BenchMap />
// 				<BenchIndex benches={benches} />
// 			</div>
// 	// 	)
// 	// }
// }