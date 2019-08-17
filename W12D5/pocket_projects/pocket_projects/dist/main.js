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

/***/ "./src/clock.js":
/*!**********************!*\
  !*** ./src/clock.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n\n\nclass Clock {\n    constructor() {\n        // 1. Create a Date object.\n        const currentTime = new Date();\n\n        // 2. Store the hour, minute, and second.\n        this.hours = currentTime.getHours();\n        this.minutes = currentTime.getMinutes();\n        this.seconds = currentTime.getSeconds();\n\n        // 3. Call printTime.\n        \n        \n        // 4. Schedule the tick at 1 second intervals.\n        setInterval(this._tick.bind(this), 1000);\n    }\n\n    printTime() {\n        // Format the time in HH:MM:SS\n        const timeString = [this.hours, this.minutes, this.seconds].join(\":\");\n\n        // Use console.log to print it.\n        // console.log(timeString);\n        return timeString;\n    }\n\n    _tick() {\n        // 1. Increment the time by one second.\n        this._incrementSeconds();\n\n        // 2. Call printTime.\n\n        const printClock = document.getElementById('clock');\n\n        Object(_warmup__WEBPACK_IMPORTED_MODULE_0__[\"htmlGenerator\"])(this.printTime(), printClock);\n\n        // this.printTime();\n    }\n\n    _incrementSeconds() {\n        // 1. Increment the time by one second.\n        this.seconds += 1;\n        if (this.seconds === 60) {\n            this.seconds = 0;\n            this._incrementMinutes();\n        }\n    }\n\n    _incrementMinutes() {\n        this.minutes += 1;\n        if (this.minutes === 60) {\n            this.minutes = 0;\n            this._incrementHours();\n        }\n    }\n\n    _incrementHours() {\n        this.hours = (this.hours + 1) % 24;\n    }\n}\n\nconst clock = new Clock();\n\n//# sourceURL=webpack:///./src/clock.js?");

/***/ }),

/***/ "./src/drop_down.js":
/*!**************************!*\
  !*** ./src/drop_down.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nconst dogs = {\n  \"Corgi\": \"https://www.akc.org/dog-breeds/cardigan-welsh-corgi/\",\n  \"Australian Shepherd\": \"https://www.akc.org/dog-breeds/australian-shepherd/\",\n  \"Affenpinscher\": \"https://www.akc.org/dog-breeds/affenpinscher/\",\n  \"American Staffordshire Terrier\": \"https://www.akc.org/dog-breeds/american-staffordshire-terrier/\",\n  \"Tosa\": \"https://www.akc.org/dog-breeds/tosa/\",\n  \"Labrador Retriever\": \"https://www.akc.org/dog-breeds/labrador-retriever/\",\n  \"French Bulldog\": \"https://www.akc.org/dog-breeds/french-bulldog/\" \n};\n\nconst dogLinkCreator = function (dogs) {\n  let dogLinks = [];\n  const dogKeys = Object.keys(dogs);\n  // const dogValues = Object.values(dogs);\n  \n  for (let i = 0; i < dogKeys.length; i++) {\n\n    let aTag = document.createElement(\"a\");\n    aTag.innerHTML = dogKeys[i];\n    aTag.href = dogs[dogKeys[i]]; // dogValues[i];\n    aTag.id = `dogs-${i}`;\n    // <a href=\"\"></a>\n\n    let liTag = document.createElement(\"li\");\n    liTag.classList = \"dog-link\"; // cannot do class or addClass\n    liTag.appendChild(aTag);\n    dogLinks.push(liTag);\n  }\n  return dogLinks;\n};\n\nconst attachDogLinks = function () {\n  const dogLinks = dogLinkCreator(dogs);\n  const dropDown = document.querySelector(\".drop-down-dog-list\");\n  for (i = 0; i < dogLinks.length; i++) {\n    dropDown.appendChild(dogLinks[i]);\n  }\n};\n\nattachDogLinks();\n\nconst handleLeave = function() {\n  const hide = document.querySelectorAll('.dog-link');\n  for (i = 0; i < hide.length; i++) {\n    hide[i].classList.remove(\"dog-link-hide\");\n  }\n};\n\nconst handleEnter = function() {\n  const show = document.querySelectorAll('.dog-link'); // html\n  for (i = 0; i < show.length; i++) {\n    show[i].classList.add(\"dog-link-hide\");\n  }\n};\n\nconst dropDown = document.querySelector(\".drop-down-dog-nav\");\ndropDown.addEventListener('mouseenter', handleEnter);\ndropDown.addEventListener('mouseleave', handleLeave); \n\n//# sourceURL=webpack:///./src/drop_down.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no exports provided */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _warmup__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./warmup */ \"./src/warmup.js\");\n/* harmony import */ var _clock__WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./clock */ \"./src/clock.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! ./drop_down */ \"./src/drop_down.js\");\n/* harmony import */ var _drop_down__WEBPACK_IMPORTED_MODULE_2___default = /*#__PURE__*/__webpack_require__.n(_drop_down__WEBPACK_IMPORTED_MODULE_2__);\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3__ = __webpack_require__(/*! ./todo_list */ \"./src/todo_list.js\");\n/* harmony import */ var _todo_list__WEBPACK_IMPORTED_MODULE_3___default = /*#__PURE__*/__webpack_require__.n(_todo_list__WEBPACK_IMPORTED_MODULE_3__);\n/* harmony import */ var _slide_scroll__WEBPACK_IMPORTED_MODULE_4__ = __webpack_require__(/*! ./slide_scroll */ \"./src/slide_scroll.js\");\n/* harmony import */ var _slide_scroll__WEBPACK_IMPORTED_MODULE_4___default = /*#__PURE__*/__webpack_require__.n(_slide_scroll__WEBPACK_IMPORTED_MODULE_4__);\n\n\n\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/slide_scroll.js":
/*!*****************************!*\
  !*** ./src/slide_scroll.js ***!
  \*****************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("function debounce(func, wait = 20, immediate = true) {\n  let timeout;\n\n  // This is the function that is actually executed when\n  // the DOM event is triggered.\n  return function executedFunction() {\n    // Store the context of this and any\n    // parameters passed to executedFunction\n    const context = this;\n    const args = arguments;\n\n    // The function to be called after debounce time has elapsed\n    const later = function () {\n      // null timeout to indicate the debounce ended\n      timeout = null;\n\n      // Call function now if you did not in the beginning\n      if (!immediate) func.apply(context, args);\n    };\n\n    // Determine if you should call the function\n    // on the leading or trail end\n    const callNow = immediate && !timeout;\n\n    // This will reset the waiting every function execution.\n    clearTimeout(timeout);\n\n    // Restart the debounce waiting period - returns true\n    timeout = setTimeout(later, wait);\n\n    // Call immediately if you're doing a leading end execution\n    if (callNow) func.apply(context, args);\n  };\n}\n\n\nconst sliderImages = document.querySelectorAll('.slide');\n\nfunction checkSlide(e) {\n  // loop over our images and see when we want each image to show\n  sliderImages.forEach(sliderImage => {\n    // half way through the image\n    const slideInAt = (window.scrollY + window.innerHeight) - sliderImage.height / 2;\n    // bottom of the image\n    const imageBottom = sliderImage.offsetTop + sliderImage.height;\n    const isHalfShown = slideInAt > sliderImage.offsetTop;\n    // see if we have scrolled past yet\n    const isNotScrolledPast = window.scrollY < imageBottom;\n    if (isHalfShown && isNotScrolledPast) {\n      sliderImage.classList.add('active');\n    } else {\n      sliderImage.classList.remove('active');\n    }\n  });\n}\n\n// Use debounce to delay your scroll function and improve efficiency!\nwindow.addEventListener('scroll', debounce(checkSlide));\n\n// const imgTag = document.querySelectorAll(\".slide\");\n\n// function checkSlide() {\n//   console.log(\"triggered\");\n// }\n\n// window.addEventListener(\"scroll\", checkSlide)\n\n// imgTag.forEach(img => img.addEventListener(\"scroll\", checkSlide));\n\n\n//# sourceURL=webpack:///./src/slide_scroll.js?");

/***/ }),

/***/ "./src/todo_list.js":
/*!**************************!*\
  !*** ./src/todo_list.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\n\nconst addTodos = document.querySelector('.add-todo-form');\nconst todoList = document.querySelector('.todos');\nconst todos = JSON.parse(localStorage.getItem('todos')) || [];\n\nconst addTodo = function(event) {\n    event.preventDefault();\n    const selectTodo = document.querySelector('[name=add-todo]').value;\n    const todo = {\n        selectTodo, done: false\n    };\n    todos.push(todo);\n    populateList(todos, todoList);\n    // selectTodo.innerHTML = \"\";\n    localStorage.setItem('todos', JSON.stringify(todos));\n    event.currentTarget.reset();\n};\n\nconst populateList = (todos = [], todoList) => {\n\n    // go over our todos and append to the item handed in\n    todoList.innerHTML = todos.map((todo, i) => {\n        // debugger;\n        return `\n        <li>\n          <input type=\"checkbox\" data-index=${i} ${todo.done ? 'checked' : ''} />\n          <label for=\"item${i}\">${todo.selectTodo}</label>\n        </li>\n      `;\n    }).join('');\n};\n\nfunction toggleDone(e) {\n    if (!e.target.matches('input')) return; // skip this unless it's an input\n    const el = e.target;\n    // we can get the element in question\n    const index = el.dataset.index;\n    // flip done status\n    todos[index].done = !todos[index].done;\n    // set up our new todos in storage and display on the page\n    localStorage.setItem('todos', JSON.stringify(todos));\n    populateList(todos, todoList);\n}\n\naddTodos.addEventListener('submit', addTodo);\ntodoList.addEventListener('click', toggleDone);\npopulateList(todos, todoList);\n\n\n\n\n// myStorage = window.localStorage;\n\n// const person = {\n//   name: \"Obaseki Nosa\",\n//   location: \"Lagos\",\n// }\n// window.localStorage.setItem('user', JSON.stringify(person));\n\n// localStorage.setItem(\"myCat\", \"Tom\");\n// var cat = localStorage.getItem(\"myCat\"); \n//     =>  “{“name”:”Obaseki Nosa”,”location”:”Lagos”}”\n//     => JSON.parse(window.localStorage.getItem('user'));\n// window.localStorage.removeItem(\"myCat\");\n// window.localStorage.clear();\n// key(): Passed a number to retrieve nth key of a localStorage\n// var KeyName = window.localStorage.key(index);\n\n\n\n\n//# sourceURL=webpack:///./src/todo_list.js?");

/***/ }),

/***/ "./src/warmup.js":
/*!***********************!*\
  !*** ./src/warmup.js ***!
  \***********************/
/*! exports provided: htmlGenerator */
/***/ (function(module, __webpack_exports__, __webpack_require__) {

"use strict";
eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export (binding) */ __webpack_require__.d(__webpack_exports__, \"htmlGenerator\", function() { return htmlGenerator; });\n\nconst partyHeader = document.getElementById('party');\n\nconst htmlGenerator = (string, htmlElement) => {\n    \n    let p = document.createElement(\"p\");\n    p.innerHTML = string;\n    \n    let childArr = htmlElement.children;\n    if (childArr) {\n        for (let i = 0; i < childArr.length; i++) {\n            htmlElement.removeChild(childArr[i]);\n        }\n    }\n    \n    htmlElement.appendChild(p);\n};\n\nhtmlGenerator('Party Time.', partyHeader);\nhtmlGenerator(\"I <3 Vanilla DOM manipulation.\", partyHeader);\n\n\n//# sourceURL=webpack:///./src/warmup.js?");

/***/ })

/******/ });