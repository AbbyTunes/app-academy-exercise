require_relative "database.rb"

require_relative "user.rb"
require_relative "question.rb"
require_relative "reply.rb"
require_relative "question_follow.rb"
require_relative "question_like.rb"

class Question_follow

    attr_accessor :id, :user_id, :question_id
    
    def self.all
        ins = QuestionsDatabase.instance.execute('SELECT * FROM question_follows')
        ins.map { |data| Question_follow.new(data) }
    end

    def self.find_by_id(id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
                *
            FROM
                question_follows
            WHERE
                id = ?
        SQL
        return nil if ins.length < 1
        Question_follow.new(ins.first)
    end

    # def self.followers_for_question_id(question_id)
    #     ins = QuestionsDatabase.instance.execute(<<-SQL, question_id)
    #         SELECT
    #             *
    #         FROM
    #             users
    #         WHERE
    #             id IN (
    #                 SELECT
    #                 user_id
    #                 FROM
    #                 question_follows
    #                 WHERE
    #                 question_id = ?
    #             )
    #     SQL

    #     ins.map do |user| 
    #         # users_arr << User.find_by_id(self.user_id)
    #         User.new(user)
    #     end
    # end

    def self.followers_for_question_id(question_id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT 
                *
            FROM
                users
            JOIN question_follows ON question_follows.user_id = users.id
            JOIN questions ON questions.id = question_follows.question_id
            WHERE
                question_follows.question_id = ?
        SQL
        ins.map { |user| User.new(user) }
    end

    # def self.followed_questions_for_user_id(user_id)
    #     ins = QuestionsDatabase.instance.execute(<<-SQL, user_id)
    #         SELECT 
    #             *
    #         FROM
    #             questions
    #         WHERE
    #             id IN (
    #                 SELECT
    #                     question_id
    #                 FROM
    #                     question_follows
    #                 WHERE
    #                     user_id = ?
    #             )
    #     SQL
    #     ins.map do |question|
    #         Question.new(question)
    #     end
    # end

    def self.followed_questions_for_user_id(user_id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT 
                *
            FROM
                questions
            JOIN question_follows ON questions.id = question_follows.question_id
            JOIN users ON users.id = question_follows.user_id
            WHERE question_follows.user_id = ?
        SQL
        ins.map { |question| Question.new(question) }
    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end


