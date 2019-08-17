

const addTodos = document.querySelector('.add-todo-form');
const todoList = document.querySelector('.todos');
const todos = JSON.parse(localStorage.getItem('todos')) || [];

const addTodo = function(event) {
    event.preventDefault();
    const selectTodo = document.querySelector('[name=add-todo]').value;
    const todo = {
        selectTodo, done: false
    };
    todos.push(todo);
    populateList(todos, todoList);
    // selectTodo.innerHTML = "";
    localStorage.setItem('todos', JSON.stringify(todos));
    event.currentTarget.reset();
};

const populateList = (todos = [], todoList) => {

    // go over our todos and append to the item handed in
    todoList.innerHTML = todos.map((todo, i) => {
        // debugger;
        return `
        <li>
          <input type="checkbox" data-index=${i} ${todo.done ? 'checked' : ''} />
          <label for="item${i}">${todo.selectTodo}</label>
        </li>
      `;
    }).join('');
};

function toggleDone(e) {
    if (!e.target.matches('input')) return; // skip this unless it's an input
    const el = e.target;
    // we can get the element in question
    const index = el.dataset.index;
    // flip done status
    todos[index].done = !todos[index].done;
    // set up our new todos in storage and display on the page
    localStorage.setItem('todos', JSON.stringify(todos));
    populateList(todos, todoList);
}

addTodos.addEventListener('submit', addTodo);
todoList.addEventListener('click', toggleDone);
populateList(todos, todoList);




// myStorage = window.localStorage;

// const person = {
//   name: "Obaseki Nosa",
//   location: "Lagos",
// }
// window.localStorage.setItem('user', JSON.stringify(person));

// localStorage.setItem("myCat", "Tom");
// var cat = localStorage.getItem("myCat"); 
//     =>  “{“name”:”Obaseki Nosa”,”location”:”Lagos”}”
//     => JSON.parse(window.localStorage.getItem('user'));
// window.localStorage.removeItem("myCat");
// window.localStorage.clear();
// key(): Passed a number to retrieve nth key of a localStorage
// var KeyName = window.localStorage.key(index);


