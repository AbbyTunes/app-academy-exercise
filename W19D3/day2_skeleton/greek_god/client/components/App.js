import React from "react";
import { Route, Switch } from 'react-router-dom';
import GodsList from './gods/GodsList.js';
import Create from './create/Create';
import Nav from './navigation/Navigation';
import GodDetail from './gods/GodDetail';

const App = () => {
	return (
		<div>
			<Route path="/" component={Nav} />
			<Switch>
				<Route exact path="/gods/:id" component={GodDetail} />
				<Route exact path="/new" component={Create} />
				<Route exact path="/" component={GodsList} />
			</Switch>
		</div>
	);
};

export default App;
