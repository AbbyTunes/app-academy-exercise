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

    def self.followers_for_question_id(question_id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                users
            WHERE
                id IN (
                    SELECT
                    user_id
                    FROM
                    question_follows
                    WHERE
                    question_id = ?
                )
        SQL

        
        ins.map do |user| 
            # User.find_by_id(user_id)
            User.new(user)
        end 

    end

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end


