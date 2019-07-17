require_relative "database.rb"

require_relative "user.rb"
require_relative "question.rb"
require_relative "reply.rb"
require_relative "question_follow.rb"
require_relative "question_like.rb"

class Question_like

    attr_accessor :id, :user_id, :question_id
    
    def self.all
        ins = QuestionsDatabase.instance.execute('SELECT * FROM question_likes')
        ins.map { |data| Question_like.new(data) }
    end
    
    def self.find_by_id(id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_likes
            WHERE
                id = ?
        SQL
        return nil if ins.length < 1
        Question_like.new(ins.first)
    end

    def self.likers_for_question_id(question_id)
        hash = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users
            JOIN 
                question_likes 
            ON 
                question_likes.user_id = users.id
            WHERE
                question_likes.question_id = ?
        SQL
        hash.map { |liker| User.new(liker) } 
        # JOIN questions ON questions.id = question_likes.question_id
    end

    def self.num_likes_for_question_id(question_id)
        # hash = QuestionsDatabase.instance.execute(<<-SQL, question_id)
        #     SELECT
        #         COUNT(*) AS likes
        #     FROM
        #         question_likes
        #     JOIN questions 
        #     ON questions.id = question_likes.question_id
        #     GROUP BY
        #         questions.id
        #     HAVING
        #         question_likes.question_id = ?
        # SQL
        hash = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                COUNT(*) AS likes
            FROM
                questions
            JOIN
                question_likes
            ON 
                questions.id = question_likes.question_id
            WHERE
                question_likes.question_id = ?
        SQL
    end

    def self.liked_questions_for_user_id(user_id)
        hash = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                questions
            JOIN
                question_likes
            ON 
                questions.id = question_likes.question_id
            WHERE 
                question_likes.user_id = ?
        SQL
        hash.map { |question| Question.new(question) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end
