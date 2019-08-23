const fetchTodos = () => {
    return $.ajax({
        method: 'GET',
        url: '/api/todos'
    });
};

export default fetchTodos;