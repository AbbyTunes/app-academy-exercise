require_relative "database.rb"

require_relative "user.rb"
require_relative "question.rb"
require_relative "reply.rb"
require_relative "question_follow.rb"
require_relative "question_like.rb"

class Reply < ModelBase

    attr_accessor :id, :user_id, :question_id, :reply_id, :reply_body

    # def self.all
    #     ins = QuestionsDatabase.instance.execute('SELECT * FROM replies')
    #     ins.map { |data| Reply.new(data) }
    # end

    # def self.find_by_id(id)
    #     ins = QuestionsDatabase.instance.execute(<<-SQL, id)
    #         SELECT
    #             *
    #         FROM
    #             replies
    #         WHERE
    #             id = ?
    #     SQL
    #     return nil if ins.length < 1
    #     Reply.new(ins.first)
    # end

    def self.find_by_user_id(user_id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, user_id)
            SELECT
                *
            FROM
                replies
            WHERE
                user_id = ?
        SQL
        return nil if ins.length < 1
        ins.map { |data| Reply.new(data) }
    end

    def self.find_by_question_id(question_id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, question_id)
            SELECT
                *
            FROM
                replies
            WHERE
                question_id = ?
        SQL
        return nil if ins.length < 1
        ins.map { |question_id| Reply.new(question_id) }
    end     

    def initialize(options)
        @id = options['id']
        @user_id = options['user_id']
        @question_id = options['question_id']
        @reply_id = options['reply_id']
        @reply_body = options['reply_body']        
    end

    def author
        User.find_by_id(user_id)
    end

    def question
        Question.find_by_id(question_id)
    end

    def parent_reply
        Reply.find_by_id(self.reply_id)
    end

    def child_replies(reply_id)
        ins = QuestionsDatabase.instance.execute(<<-SQL, reply_id)
            SELECT 
                *
            FROM 
                replies
            WHERE 
                reply_id = ?
        SQL
        ins.map { |reply_hash| Reply.new(reply_hash) }
    end

end
