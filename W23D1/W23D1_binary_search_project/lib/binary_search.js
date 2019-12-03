function binarySearch(array, target) {
	if (!array.length) return false;

	let midIdx = Math.floor(array.length / 2);

	let leftArray = array.slice(0, midIdx);
	let rightArray = array.slice(midIdx + 1);
	// slice: inclusive startIdx, exclusive endIdx

	if (target < array[midIdx]) {
		return binarySearch(leftArray, target);
		// return
	} else if (target > array[midIdx]) {
		return binarySearch(rightArray, target);
	} else {
		return true;
	}
}

function binarySearchIndex(array, target, low=0, high=array.length-1) {

	// keep track of low index and hight index
	if (low === high) return -1;
	// in place search
	// no new arrays
	let midIdx = Math.floor((low + high) / 2);

	if (target < array[midIdx]) {
		return binarySearchIndex(array, target, low, midIdx);
	} else if (target > array[midIdx]) {
		return binarySearchIndex(array, target, midIdx + 1, high);
	} else {
		return midIdx;
	}
}


module.exports = {
    binarySearch,
    binarySearchIndex
};