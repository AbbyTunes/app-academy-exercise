const graphql = require("graphql");
const mongoose = require("mongoose");

const { GraphQLObjectType, GraphQLList } = graphql;

const User = mongoose.model("user");
const UserType = require("./user_type");

const RootQuery = new GraphQLObjectType({
	name: "RootQueryType",
	fields: {
		users: {
			// This is the type we defined in the last step,
			// wrapped in a GraphQLList to specify that the data will be returned as an array.
			type: new GraphQLList(UserType),
			// We must specify a resolve function to tell GraphQL how to access the data.
			// Even if there are many fields present on a given user,
			// only the fields we specified on the User type will be returned.
			resolve() {
				// This is just a mongoose method
				return User.find({});
			}
		},
		user: {
			type: UserType,
			args: { id: { type: new GraphQLNonNull(GraphQLID) } },
			resolve(parentValue, { id }) {
				return User.findById(id)
			}
		},
		// user: {
		// 	// We are now querying for a single User, so we don't need to wrap the type in GraphQLList
		// 	type: UserType,
		// 	// We must define a type for the arguments which will be passed in to the query.
		// 	// GraphQLNonNull specifies that the argument must be included
		// 	args: { id: { type: new GraphQLNonNull(GraphQLID) } },
		// 	// The args argument represents the *actual* arguments passed into the query
		// 	resolve(parentValue, args) {
		// 		return User.findById(args.id)
		// 	}
		// }
		posts: {
			// we want all our returned posts in an Array so we use the GraphQLList type
			type: new GraphQLList(PostType),
			resolve() {
				return Post.find({});
			}
		},
		post: {
			// here we just want to return a single post
			type: PostType,
			// we need an id for this query so we'll use GraphQLNonNull
			args: { id: { type: new GraphQLNonNull(GraphQLID) } },
			resolve(parentValue, args) {
				return Post.findById(args.id)
			}
		}
	}
});

module.exports = RootQuery;