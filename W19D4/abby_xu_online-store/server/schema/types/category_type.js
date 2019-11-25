const mongoose = require("mongoose");
const graphql = require("graphql");
const { GraphQLObjectType, GraphQLString, GraphQLID, GraphQLList} = graphql;
// const ProductType = require("./product_type");
const Category = mongoose.model("categories");

const CategoryType = new GraphQLObjectType({
    name: "CategoryType",
    fields: () => ({
        _id: { type: GraphQLID },
        name: { type: GraphQLString },
        products: { 
            type: new GraphQLList(require("./product_type")),
            resolve(parentValue) {
                return Category.getProducts(parentValue._id);
        } }
    })
});

module.exports = CategoryType;