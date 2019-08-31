import React from "react";
import { connect } from "react-redux";
import sessionForm from './session_form';
import { signup } from '../../actions/session_actions';

const mapStateToProps = (state) => ({
  formType: 'signup'
  
});
 // errors: [array of errors]

const mapDispatchToProps = (dispatch) => ({
  processForm: (user) => dispatch(signup(user))
});

export default connect(
  mapStateToProps,
  mapDispatchToProps
)(sessionForm);