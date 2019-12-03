// ============================================================================
// Implementation Exercise: Singly Linked List
// ============================================================================
//
// -------
// Prompt:
// -------
//
// Implement a Singly Linked List and all of its methods below!
//
// ------------
// Constraints:
// ------------
//
// Make sure the time and space complexity of each is equivalent to those 
// in the table provided in the Time and Space Complexity Analysis section
// of your Linked List reading!
//
// -----------
// Let's Code!
// -----------

// https://www.geeksforgeeks.org/implementation-linkedlist-javascript/

// https://humanwhocodes.com/blog/2019/01/computer-science-in-javascript-linked-list/

// TODO: Implement a Linked List Node class here
class Node {
    constructor(val) {
		this.value = val;
		this.next = null;
    }
}

// TODO: Implement a Singly Linked List class here
class LinkedList {
    constructor() {
		this.head = null;
		this.tail = null;
		this.length = 0;
		//1) Should always keep track of the length of the list
    }

    // TODO: Implement the addToTail method here
    addToTail(val) {
		const newNode = new Node(val);
		
		if (!this.head) {
			this.head = newNode;
		} else {
			this.tail.next = newNode;
		}
		this.tail = newNode;

		// this.length += 1;
		this.length++;
		return this;
    }

	// TODO: Implement the removeTail method here
	
    removeTail() {
		if (!this.head) return undefined;

		let current = this.head;
		// let i = 0;
		let temp = current;

		while (current.next !== null) {
			temp = current;
			current = current.next;
			// i++;
		}
		// interate through to the tail
		this.tail = temp;
		this.tail.next = null;
		this.length--;

		if (this.length === 0) {
			this.head = null;
			this.tail = null;
		}
		return current;
    }

    // TODO: Implement the addToHead method here
    addToHead(val) {

		let newNode = new Node(val)
		if (!this.head) {
			this.head = newNode;
			this.tail = newNode;
			// this.length++;
		} else {
			let temp = this.head;
			// this.head.previous = newNode;
			this.head = newNode;
			this.head.next = temp

			// standard solution:
			// newNode.next = this.head;
			// this.head = newNode;
		}
		this.length++;
		return this;
    }

    // TODO: Implement the removeHead method here
    removeHead() {
		if (!this.head) return undefined;
		let currentHead = this.head;
		// this.head = this.head.next;
		this.head = currentHead.next;
		// currentHead.next = this.head;
		this.length--;
		if (this.length === 0) {
			this.tail = null;
		}
		return currentHead;
    }

	// TODO: Implement the contains method here
	
    contains(target) {
		// if (!this.head) return false;
		// let current = this.head;
		// while (current.next) {
		// 	if (current.value === target) return true;
		// 	current = current.next;
		// }
		// return current.value === target ? true : false;

		let current = this.head;
		while (current) {
			if (current.value === target) return true;
			current = current.next;
		}
		return false;
    }

    // TODO: Implement the get method here
    get(index) {
		if (!this.length || index < 0 || index >= this.length) return null;
		// index must be inside of this linked list
		let current = this.head;
		let i = 0;
		while (i < index) {
			current = current.next;
			i++;
		}
		// return current && i === index ? current.value : null;
		return current;
    }

    // TODO: Implement the set method here
    set(index, val) {
		// if (!this.length || index < 0 || index >= this.length) return false;
		// let current = this.head;
		// let i = 0;
		// while (i < index) {
		// 	current = current.next;
		// 	i++;
		// }
		// current.value = val;
		// return true;
		let current = this.get(index);
		if (current) {
			current.value = val;
			return true;
		}
		return false;
    }

    // TODO: Implement the insert method here
    insert(index, val) {
		let current = this.get(index);
		if (!current) return false;

		let newNode = new Node(val);
		let previousNode = current.previous;
		previousNode.next = newNode;
		newNode.next = current;
		this.length++;
		return true;
    }

    // TODO: Implement the remove method here
    remove(index) {

    }

    // TODO: Implement the size method here
    size() {
		return this.length;
    }
}

exports.Node = Node;
exports.LinkedList = LinkedList;
