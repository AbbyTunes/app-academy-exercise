const mongoose = require("mongoose");
const Schema = mongoose.Schema;

const UserSchema = new Schema({
    name: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    password: {
        type: String,
        required: true,
        min: 8,
        max: 32
    },
    date: {
        type: Date,
        default: Date.now
    },
    products: [{
        type: Schema.Types.ObjectId,
        ref: "products"
    }]
});

module.exports = mongoose.model("users", UserSchema);