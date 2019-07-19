require "sqlite3" # gem
require "singleton" # only have one instance of our database
require "active_support/inflector"

class QuestionsDatabase < SQLite3::Database
    include Singleton

    def initialize
        super("questions.db")
        self.type_translation = true
        self.results_as_hash = true
    end
end

class ModelBase

    def self.table
        # self.to_s.tableize # need to work with % require 'active_support/inflector' %
        self.to_s.underscore.pluralize # this will work, not .camelcase or .snakecase
    end

    def self.find_by_id(id)
        options = QuestionsDatabase.instance.execute(<<-SQL, id)
            SELECT
            *
            FROM
            #{self.table}
            WHERE
            id = ?
        SQL
        self.objectify_all(options)
    end

    def self.all
        options = QuestionsDatabase.instance.execute(<<-SQL)
            SELECT
                *
            FROM
                #{self.table}
        SQL
        self.objectify_all(options)
    end

    def self.objectify_all(options)
        options.map do |option|
            self.new(option)
        end
    end

    def columns
    end

    def save(id) # insert or update # instance method
        if id.nil?
            insert
        else
            update
        end
        # no need to return anything
    end


end


# class Tag
#   def initialize(params = {})
#     @name = params['name']
#     @id = params['id']
#   end

#   def self.most_popular(n)
#     results = QuestionsDatabase.execute(<<-SQL, n)
#       SELECT
#         tags.*
#       FROM
#         question_tags
#       JOIN
#         question_likes
#       ON
#         question_tags.question_id = question_likes.question_id
#       JOIN
#         tags
#       ON
#         question_tags.tag_id = tags.id
#       GROUP BY
#         tag_id
#       ORDER BY
#         COUNT(*) DESC
#       LIMIT
#         ?
#     SQL

#     results.map { |result| Tag.new(result) }
#   end
# end
