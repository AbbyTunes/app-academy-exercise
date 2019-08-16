class DOMNodeCollection {

  constructor(nodesArr) {
    this.nodesArr = nodesArr;
    // html nodes 
    // not DOMNode instance
  }

  html(element) {
    if (typeof element === "string") {
      this.nodesArr.forEach((node) => {
        node.innerHTML = element;
      });
    } else if (arguments.length === 0 && this.nodesArr.length > 0) {
      return this.nodesArr[0].innerHTML;
    }
  }

  empty() {
    this.nodesArr.forEach((node) => {
      node.innerHTML = "";
    });
  }

  // append(arr) {
  //   arr.forEach((el) => {
  //     // el.innerHTML(el.outerHTML);  

  //     this.nodesArr[0].innerHTML = el;
  //     el.outerHTML = this.nodesArr[0];
  //   });
  // }

  // ele => "<p>test</p>"
  append(arg) { // a string or a DOMNode instance
    if (typeof arg === "string") {
      this.nodesArr.forEach( (node) => {
        node.innerText += arg;
      });
    } else if (arg instanceof DOMNodeCollection) {
      this.nodesArr.forEach((node) => {
        arg.nodesArr.forEach( (argNode) => {
          node.appendChild(argNode);
        })
      });
    }
    
  }

  // <ul>
  //   <li>ele</li>
      // <li></li>
  // </ul>
  

  attr(key, val) {
    this.nodesArr.forEach((node) => {
      if (arguments.length === 2) {
        node[key] = val;
      } else if (arguments.length === 1) {
        return node[key];
      }
    });
  }

  addClass(class_name) {
    // this.node
    this.nodesArr.forEach((node) => {
      node.classList.add(class_name)
    });
  } 

  removeClass(class_name) {
    // this.node
    this.nodesArr.forEach( (node) => {
      node.classList.remove(class_name) 
    });
  } 

  children() {
    let nodesChildren = [];
    this.nodesArr.forEach((node) => {
      Array.from(node.childNodes).forEach((child) => {
        nodesChildren.push(child);
      });
    });
    return new DOMNodeCollection(nodesChildren);
  }

  parent() {
    let nodesParents = [];
    this.nodesArr.forEach((node) => {
      let parent = node.parentNode;
      if (!nodesParents.includes(parent)) {
        nodesParents.push(parent);
      }
    });
    return new DOMNodeCollection(nodesParents);
  }
  
  // find() {
      // <li>
      //   <li>
      //   <ul>


      //     <li></li>
      //       <ul>
  // }

  remove(nodesArr) {
    this.nodesArr[0].parent.children = []; // undefined / null
  }

}
module.exports = DOMNodeCollection;