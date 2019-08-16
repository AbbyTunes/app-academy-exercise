/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./src/index.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./src/dom_node_collection.js":
/*!************************************!*\
  !*** ./src/dom_node_collection.js ***!
  \************************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("class DOMNodeCollection {\n\n  constructor(nodesArr) {\n    this.nodesArr = nodesArr;\n    // html nodes \n    // not DOMNode instance\n  }\n\n  html(element) {\n    if (typeof element === \"string\") {\n      this.nodesArr.forEach((node) => {\n        node.innerHTML = element;\n      });\n    } else if (arguments.length === 0 && this.nodesArr.length > 0) {\n      return this.nodesArr[0].innerHTML;\n    }\n  }\n\n  empty() {\n    this.nodesArr.forEach((node) => {\n      node.innerHTML = \"\";\n    });\n  }\n\n  // append(arr) {\n  //   arr.forEach((el) => {\n  //     // el.innerHTML(el.outerHTML);  \n\n  //     this.nodesArr[0].innerHTML = el;\n  //     el.outerHTML = this.nodesArr[0];\n  //   });\n  // }\n\n  // ele => \"<p>test</p>\"\n  append(arg) { // a string or a DOMNode instance\n    if (typeof arg === \"string\") {\n      this.nodesArr.forEach( (node) => {\n        node.innerText += arg;\n      });\n    } else if (arg instanceof DOMNodeCollection) {\n      this.nodesArr.forEach((node) => {\n        arg.nodesArr.forEach( (argNode) => {\n          node.appendChild(argNode);\n        })\n      });\n    }\n    \n  }\n\n  // <ul>\n  //   <li>ele</li>\n      // <li></li>\n  // </ul>\n  \n\n  attr(key, val) {\n    this.nodesArr.forEach((node) => {\n      if (arguments.length === 2) {\n        node[key] = val;\n      } else if (arguments.length === 1) {\n        return node[key];\n      }\n    });\n  }\n\n  addClass(class_name) {\n    // this.node\n    this.nodesArr.forEach((node) => {\n      node.classList.add(class_name)\n    });\n  } \n\n  removeClass(class_name) {\n    // this.node\n    this.nodesArr.forEach( (node) => {\n      node.classList.remove(class_name) \n    });\n  } \n\n  children() {\n    let nodesChildren = [];\n    this.nodesArr.forEach((node) => {\n      Array.from(node.childNodes).forEach((child) => {\n        nodesChildren.push(child);\n      });\n    });\n    return new DOMNodeCollection(nodesChildren);\n  }\n\n  parent() {\n    let nodesParents = [];\n    this.nodesArr.forEach((node) => {\n      let parent = node.parentNode;\n      if (!nodesParents.includes(parent)) {\n        nodesParents.push(parent);\n      }\n    });\n    return new DOMNodeCollection(nodesParents);\n  }\n  \n  // find() {\n      // <li>\n      //   <li>\n      //   <ul>\n\n\n      //     <li></li>\n      //       <ul>\n  // }\n\n  remove(nodesArr) {\n    this.nodesArr[0].parent.children = []; // undefined / null\n  }\n\n}\nmodule.exports = DOMNodeCollection;\n\n//# sourceURL=webpack:///./src/dom_node_collection.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const DomNodeCollection = __webpack_require__(/*! ./dom_node_collection */ \"./src/dom_node_collection.js\");\n\nfunction $l(arg) {\n  // JQuery selector => JQuery object\n  let list = Array.from(document.querySelectorAll(arg));\n  // debugger;\n  return new DomNodeCollection(list);\n  // has all the prototype which are the methods defined \n}\n\n\n\nwindow.$l = $l\nmodule.exports = $l\n\n// const _docReadyCallbacks = [];\n// let _docReady = false;\n\n// window.$l = (arg) => {\n//   switch (typeof arg) {\n//     case \"function\":\n//       return registerDocReadyCallback(arg);\n//     case \"string\":\n//       return getNodesFromDom(arg);\n//     case \"object\":\n//       if (arg instanceof HTMLElement) {\n//         return new DomNodeCollection([arg]);\n//       }\n//   }\n// };\n\n// $l.extend = (base, ...otherObjs) => {\n//   otherObjs.forEach((obj) => {\n//     for (const prop in obj) {\n//       base[prop] = obj[prop];\n//     }\n//   });\n//   return base;\n// };\n\n// $l.ajax = (options) => {\n//   const request = new XMLHttpRequest();\n//   const defaults = {\n//     contentType: 'application/x-www-form-urlencoded; charset=UTF-8',\n//     method: \"GET\",\n//     url: \"\",\n//     success: () => { },\n//     error: () => { },\n//     data: {},\n//   };\n//   options = $l.extend(defaults, options);\n//   options.method = options.method.toUpperCase();\n\n//   if (options.method === \"GET\") {\n//     // data is query string for get\n//     options.url += `?${toQueryString(options.data)}`;\n//   }\n\n//   request.open(options.method, options.url, true);\n//   request.onload = (e) => {\n//     // NB: Triggered when request.readyState === XMLHttpRequest.DONE ===  4\n//     if (request.status === 200) {\n//       options.success(request.response);\n//     } else {\n//       options.error(request.response);\n//     }\n//   };\n\n//   request.send(JSON.stringify(options.data));\n// };\n\n// // helper methods\n// const toQueryString = (obj) => {\n//   let result = \"\";\n//   for (const prop in obj) {\n//     if (Object.prototype.hasOwnProperty.call(obj, prop)) {\n//       result += `${prop}=${obj[prop]}&`;\n//     }\n//   }\n//   return result.substring(0, result.length - 1);\n// };\n\n// const registerDocReadyCallback = (func) => {\n//   if (!_docReady) {\n//     _docReadyCallbacks.push(func);\n//   } else {\n//     func();\n//   }\n// };\n\n// const getNodesFromDom = (selector) => {\n//   const nodes = document.querySelectorAll(selector);\n//   const nodesArray = Array.from(nodes);\n//   return new DomNodeCollection(nodesArray);\n// };\n\n// document.addEventListener('DOMContentLoaded', () => {\n//   _docReady = true;\n//   _docReadyCallbacks.forEach(func => func());\n// });\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ })

/******/ });