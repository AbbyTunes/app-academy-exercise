# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
todo1 = Todo.create({
        title: 'wash car',
        body: 'with soap',
        done: false
    })

todo2 = Todo.create({
        title: 'wash dog',
        body: 'with shampoo',
        done: true
    })

todo3 = Todo.create({
    title: 'clean my room',
    body: 'with detergent',
    done: false
})

todo4 = Todo.create({
    title: 'Buy milk',
    body: 'I need a carton!',
    done: false
})
