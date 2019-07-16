require_relative "database.rb"

require_relative "user.rb"
require_relative "question.rb"
require_relative "reply.rb"
require_relative "question_follow.rb"
require_relative "question_like.rb"

class Question

    attr_accessor :id, :title, :question_body, :user_id

    def self.all
        ins = QuestionsDatabase.instance.execute('SELECT * FROM questions')
        ins.map { |data| Question.new(data) }
    end

    def self.find_by_id(id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                questions
            WHERE
                id = ?
        SQL
        return nil if ins.length < 1
        Question.new(ins.first)
    end

    # always return an array of hashes
    # use .first to return the first element

    def self.find_by_author_id(author_id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, author_id)
        SELECT
            *
        FROM
            questions
        WHERE
            user_id = ?
        SQL
        return nil if ins.length < 1
        questions_arr = ins.map { |question| Question.new(question) }
    end


    def initialize(options)
        @id = options['id']
        @title = options['title']
        @question_body = options['question_body']
        @user_id = options['user_id']
    end

    def author
        User.find_by_id(user_id)
    end
    
    def replies
        Reply.find_by_question_id(self.id)
    end
end
