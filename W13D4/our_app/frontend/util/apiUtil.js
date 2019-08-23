module.exports = {
    uniqueId() {
        return new Date().getTime();
    },

    fetchTodos(){
        return $.ajax({
            method: 'GET',
            url: '/api/todos'
        });
    }
}


