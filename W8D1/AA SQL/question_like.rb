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

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
    end
end
