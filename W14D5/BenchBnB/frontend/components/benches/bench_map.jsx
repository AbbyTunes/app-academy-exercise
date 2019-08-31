import React from 'react';
import MarkerManager from '../../util/marker_manager';

class BenchMap extends React.Component {
    constructor(props) {
        super(props); // benches
    }

	componentDidMount() {
        const self = this;
		// set the map to show SF
		const mapOptions = {
			center: { lat: 37.7758, lng: -122.435 }, // this is SF
			zoom: 13
		};

		// wrap this.mapNode in a Google Map
		this.map = new google.maps.Map(this.mapNode, mapOptions); // this one works
		// this.map = new google.maps.Map(mapDOMNode, mapOptions); // cannot work

		this.MarkerManager = new MarkerManager(this.map);

		// this.updateMarkers();
	}

	componentDidUpdate() {
		// if (now) !=== (then) {
			// this.updateMarkers();
		// }
	}

	render() {
		return (
            <div id="map-container" ref={map => this.mapNode = map}>
			<h2>This is Bench_Map</h2>
			
		</div>
    );
	}
}

export default BenchMap;

