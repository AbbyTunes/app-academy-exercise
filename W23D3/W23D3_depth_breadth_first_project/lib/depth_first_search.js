function depthFirstSearch(root, targetVal) {
	// if (!root) return null;
	let stack = [root];
	while (stack.length) {
		let visited = stack.pop();
		if (visited.val === targetVal) return visited;
		if (visited.right) stack.push(visited.right);
		if (visited.left) stack.push(visited.left);
	}
	return null;
}


module.exports = {
    depthFirstSearch
};