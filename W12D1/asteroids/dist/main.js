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

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\n\nconst Asteroid = function (options) {\n    this.pos = options.pos;\n    this.vel = options.vel;\n    this.radius = options.radius;\n    this.color = options.color;\n}\n\n// class Asteroid extends MovingObject {\n//     constructor(pos, vel, radius, color) {\n//       super(pos, vel);\n//       this.pos = pos;\n//       this.vel = Util.randomVec(10);\n//       this.radius = 25;\n//       this.color = \"red\";\n//     }\n// }\n\n// new Asteroid({ pos: [30, 30] });\n// MovingObject.inherits(Asteroid)\n\n// const Util = {\n//     randomVec(length) {\n//         const deg = 2 * Math.PI * Math.random();\n//         return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n//     },\n//     // Scale the length of a vector by the given amount.\n//     scale(vec, m) {\n//         return [vec[0] * m, vec[1] * m];\n//     }\n// }\n\n\nUtil.inherits(Asteroid, MovingObject);\n\n\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\n\n\nconst Game = function () {\n    DIM_X: 30;\n    DIM_Y: 80;\n    NUM_ASTEROIDS: 5;\n    this.asteroids = [];\n}\n\nfunction getRndInteger(min, max) {\n    return Math.floor(Math.random() * (max - min)) + min;\n}\n\nGame.prototype.addAsteroids = function () {\n\n    // GREEN\n  const a1 = new Asteroid(\n    { pos: [30, 30], vel: [10, 10], radius: 25, color: \"#00FF00\" }\n  );\n\n  //BLUE\n  const a2 = new Asteroid(\n    { pos: [150, 150], vel: [20, 20], radius: 20, color: \"#00008B\" }\n  );\n  //RED\n  const a3 = new Asteroid(\n      { pos: [200, 250], vel: [20, 20], radius: 12, color: \"#A52A2A\" }\n  );\n  this.asteroids.push(a1);\n  this.asteroids.push(a2);\n  this.asteroids.push(a3);\n}\n\nGame.prototype.randomPosition = function () {\n    return [getRndInteger(0, 500), getRndInteger(0, 500)];\n}\n\nGame.prototype.draw = function (ctx) {\n  this.asteroids.forEach( function (asteroid) {\n    console.log(ctx)\n    ctx.clearRect(0,0,500,500);\n    asteroid.draw(ctx);\n  });\n}\n\nGame.prototype.moveObjects = function () {\n    this.asteroids.forEach((asteroid) => asteroid.move());\n}\n\nGame.prototype.wrap = function (pos) {\n    if (pos[0] > 500) {\n        pos[0] = 1;\n    } else if (pos[0] === 0) {\n        pos[0] = 500;\n    } else if (pos[1] > 500) {\n        pos[1] = 1;\n    } else if (pos[1] === 0) {\n        pos[1] = 500;\n    }\n}\n\nmodule.exports = Game;\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\n\nconst GameView = function (ctx) {\n    this.game = new Game();\n    this.game.addAsteroids();\n    this.ctx = ctx;\n\n}\n\nGameView.prototype.start = function () {\n    setInterval(() => {\n      this.game.moveObjects();\n      this.game.draw(this.ctx);\n    }, 200);\n    \n}\n\n\n// const newGame = new Game();\n// newGame.addAsteroids();\n// newGame.randomPosition();\n// newGame.draw();\n\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("// const MovingObject = require(\"./moving_object.js\")\n// const Asteroid = require(\"./asteroid.js\")\n// const Util = require(\"./util.js\")\nconst MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\")\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\nconst Util = __webpack_require__(/*! ./util.js */ \"./src/util.js\")\n\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\n\nconsole.log(\"adfasgasfd\")\nconsole.log(\"Welcome to the game\")\n\n\n// HAPPENS once the page loads, html on page\n// window.addEventListener('DOMContentLoaded', (event) => {\n//     const canvas = document.getElementById(\"game-canvas\");\n//     const context = canvas.getContext(\"2D\");\n//     console.log('we called event listener');\n\n//     let mo = new MovingObject(\n//       {pos: [30, 30], vel: [10, 10], radius: 5, color: \"#00FF00\" }\n//     );\n\n//     mo.draw(context);\n// });\n\n\nwindow.addEventListener(\"DOMContentLoaded\", function () {\n    // MOVING OBJECT STUFF\n  const canvas = document.getElementById(\"game-canvas\");\n  const ctx = canvas.getContext('2d');\n\n    // const newGame = new Game();\n    // newGame.addAsteroids();\n    // newGame.randomPosition();\n\n\n    const newGameView = new GameView(ctx);\n    newGameView.start();\n\n\n\n// newGame.draw();\n  // let mo = new MovingObject(\n  //     {pos: [30, 30], vel: [10, 10], radius: 30, color: \"#00FF00\" }\n  //   );\n\n  // mo.draw(ctx);\n  // mo.move();\n//   ctx.clearRect(0,0,500,500);\n//   ctx.fillRect(0,0,500,500);\n//   mo.draw(ctx);\n \n\n  // console.log(ctx);\n\n//   let asteroid = new Asteroid(\n//       { pos: [150, 150], vel: [20, 20], radius: 50, color: \"#00008B\" }\n//   );\n//   asteroid.draw(ctx);\n//   asteroid.move();\n\n});\n\nwindow.MovingObject = MovingObject;\nwindow.Util = Util;\nwindow.Asteroid = Asteroid;\nwindow.Game = Game;\n\n//   ctx.fillStyle = 'green';\n//   ctx.fillRect(10, 10, 150, 100);\n\n// //MY HOUSE TESTING\n//     const canvas2 = document.getElementById('my-house');\n//     const ctx2 = canvas2.getContext('2d');\n//     // Set line width\n//     ctx2.lineWidth = 10;\n\n//     // Wall\n//     ctx2.strokeRect(75, 140, 150, 110);\n\n//     // Door\n//     ctx2.fillRect(130, 190, 40, 60);\n\n//     // Roof\n//     ctx2.moveTo(50, 140);\n//     ctx2.lineTo(150, 60);\n//     ctx2.lineTo(250, 140);\n//     ctx2.closePath();\n//     ctx2.stroke();\n\n// const canvasEl = document.getElementsByTagName(\"canvas\")[0];\n// canvasEl.height = window.innerHeight;\n// canvasEl.width = window.innerWidth;\n// new Game(\n//   canvasEl.width,\n//   canvasEl.height\n// ).start(canvasEl);\n\n\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/*! no static exports found */
/***/ (function(module, exports, __webpack_require__) {

eval("const Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\n\n\nfunction MovingObject(obj) {\n  this.pos = obj.pos;\n  this.vel = obj.vel;\n  this.radius = obj.radius;\n  this.color = obj.color;\n}\n\n\n// const mo = new MovingObject(\n//   { pos: [30, 30], vel: [10, 10], radius: 5, color: \"#00FF00\" }\n// );\n// console.log(mo)\n\n// function MovingObject(...args) {\n//   this.pos = pos;\n//   this.vel = vel;\n//   this.radius = radius;\n//   this.color = color;\n// }\n// const movingObject = new MovingObject();\n\n\nMovingObject.prototype.draw = function (ctx) {\n    // console.log(this.pos);\n    // console.log(ctx);\n\n\n    ctx.fillStyle = this.color;\n    ctx.beginPath();\n\n    ctx.arc(\n        this.pos[0],\n        this.pos[1],\n        this.radius,\n        0,\n        2 * Math.PI,\n        false\n    );\n\n    ctx.fill();\n}\n\nMovingObject.prototype.move = function () {\n\n    //WRAP LOGIC\n\n  let newX = this.pos[0] + this.vel[0];\n  let newY = this.pos[1] + this.vel[1];\n\n  this.pos[0] = newX;\n  this.pos[1] = newY;\n}\n\nmodule.exports = MovingObject\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/util.js":
/*!*********************!*\
  !*** ./src/util.js ***!
  \*********************/
/*! no static exports found */
/***/ (function(module, exports) {

eval("\nconst Util = {\n    inherits(childClass, parentClass) {\n        function Surrogate() {};\n        Surrogate.prototype = parentClass.prototype;\n        childClass.prototype = new Surrogate();\n        childClass.prototype.constructor = childClass;\n    },\n    randomVec(length) {\n        const deg = 2 * Math.PI * Math.random();\n        return Util.scale([Math.sin(deg), Math.cos(deg)], length);\n    },\n    // Scale the length of a vector by the given amount.\n    scale(vec, m) {\n        return [vec[0] * m, vec[1] * m];\n    }\n}\n\n\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/util.js?");

/***/ })

/******/ });