import React from "react";
import { Route, Switch } from "react-router-dom";
import AuthRoute from "../util/route_util";
import Login from "./Login";
import Register from "./Register";
import Nav from "./Nav";
import ProductIndex from "./products/ProductIndex";
import ProductDetail from "./products/ProductDetail";
import CreateProduct from "./products/CreateProduct";
import Cart from "./cart/Cart";

const App = () => {
  return (
    <div>
      <h1>Online Store</h1>
      <Nav />
      <Switch>
        <AuthRoute exact path="/login" component={Login} routeType="auth" />
        <AuthRoute exact path="/signup" component={Register} routeType="auth" />
        <Route exact path="/products" component={ProductIndex} />
        <Route exact path="/products/new" component={CreateProduct} />
        <Route exact path="/products/:productId" component={ProductDetail} />
        <Route exact path="/cart" component={Cart} />
      </Switch>
    </div>
  );
};

export default App;