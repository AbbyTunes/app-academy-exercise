function treeSum(root) {
	if (!root) return 0;
	// let sum = 0;
	// console.log(root.val);
	return root.val + treeSum(root.left) + treeSum(root.right);
}

module.exports = {
    treeSum
};