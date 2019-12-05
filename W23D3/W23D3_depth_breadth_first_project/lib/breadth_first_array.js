function breadthFirstArray(root) {
	let visited = [];
	let queue = [root];
	while (queue.length) {
		let checked = queue.shift();
		visited.push(checked.val);
		if (checked.left) queue.push(checked.left);
		if (checked.right) queue.push(checked.right);
	}
	return visited;
}

module.exports = {
    breadthFirstArray
};