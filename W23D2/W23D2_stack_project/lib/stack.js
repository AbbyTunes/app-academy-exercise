// ============================================================================
// Implementation Exercise: Stack
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Stack and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Stack reading!
//
// -----------
// Let's Code!
// -----------

class Node {
	constructor(val) {
		this.value = val;
		this.next = null;
	}
}

class Stack {
	constructor() {
		this.top = null;
		this.bottom = null;
		this.length = 0;
	}

	push(val) {
		const newNode = new Node(val);
		if (!this.length) {
			this.top = newNode;
			this.bottom = newNode;
		} else {
			let temp = this.top;
			this.top = newNode;
			this.top.next = temp; 
			// next is below
		}
		return ++this.length;
	}

	pop() {
		if (!this.bottom) return null;
		let temp = this.top;
		if (this.length === 1) {
			this.top = null;
			this.bottom = null;
		} else {
			this.top = this.top.next;
			// next is below
		}
		this.length--;
		return temp.value;
	}

	size() {
		return this.length;
	}

}

exports.Node = Node;
exports.Stack = Stack;
