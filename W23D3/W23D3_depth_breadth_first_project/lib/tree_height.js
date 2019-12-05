function treeHeight(root) {
	if (!root) return -1;
	if (!root.left && !root.right) return 0;
	// console.log(root.val);
	let leftHeight = 1 + treeHeight(root.left);
	let rightHeight = 1 + treeHeight(root.right);
	// return Math.max(leftHeight, rightHeight);
	return leftHeight > rightHeight ? leftHeight : rightHeight;
}


module.exports = {
    treeHeight
};