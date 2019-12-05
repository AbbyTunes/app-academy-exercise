// function inOrderArray(root, inOrderArr = []) {

// 	if (!root) return inOrderArr;

// 	if (root.left) {
// 		inOrderArray(root.left);
// 		console.log(inOrderArr);
// 	}
// 	inOrderArr.concat(root.value);
// 	console.log(inOrderArr);
// 	if (root.left) {
// 		inOrderArray(root.right);
// 		console.log(inOrderArr);
// 	}
// }

function inOrderArray(root) {
	if (!root) return [];
	return [
		...inOrderArray(root.left),
		root.val,
		...inOrderArray(root.right)
	];
}

function postOrderArray(root) {
	if (!root) return [];
	return [
		...postOrderArray(root.left),
		...postOrderArray(root.right),
		root.val
	];
}


module.exports = {
    inOrderArray,
    postOrderArray
};