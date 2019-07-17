require_relative "database.rb"

require_relative "user.rb"
require_relative "question.rb"
require_relative "reply.rb"
require_relative "question_follow.rb"
require_relative "question_like.rb"

class User

    attr_accessor :id, :fname, :lname

    def self.all
        ins = QuestionsDatabase.instance.execute('SELECT * FROM users')
        ins.map { |data| User.new(data) }
    end

    def self.find_by_id(id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                id, fname, lname
            FROM
                users
            WHERE
                id = ?
        SQL
        return nil if ins.length < 1
        User.new(ins.first)
    end

    def self.find_by_name(fname, lname)
        ins = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
            SELECT
                id, fname, lname
            FROM
                users
            WHERE
                fname = ? AND lname = ?
        SQL
        return nil if ins.length < 1
        User.new(ins.first)
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def update_fname(new_name, id)
        QuestionsDatabase.instance.execute(<<-SQL, new_name, id)
        UPDATE
            users
        SET 
            fname = ?
        WHERE
            id = ?
        SQL
        p self.id
        self 
    end

    def authored_questions
        questions_arr = Question.find_by_author_id(self.id)
    end

    def authored_replies
        Reply.find_by_user_id(self.id)
    end

    def liked_questions
        Question_like.liked_questions_for_user_id(id)
    end
end

# abby_ins = User.find_by_last_name('Xu')
# self = abby, it's a new object, didn't change
# need an id to locate and change the one specific instance
# if didn't use WHERE, will change name for all instances
# pass in arguments in order, using ? to reference it
# heredoc returns a string

